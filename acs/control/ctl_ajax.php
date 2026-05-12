<?php

class ctl_ajax
{

    //图片上传
    public function upload()
    {
        try {
            // 详细调试信息
            $debug_info = array(
                'REQUEST_METHOD' => $_SERVER['REQUEST_METHOD'],
                'CONTENT_TYPE' => isset($_SERVER['CONTENT_TYPE']) ? $_SERVER['CONTENT_TYPE'] : 'N/A',
                'CONTENT_LENGTH' => isset($_SERVER['CONTENT_LENGTH']) ? $_SERVER['CONTENT_LENGTH'] : 'N/A',
                'POST_count' => count($_POST),
                'FILES_count' => count($_FILES),
                'POST_data' => $_POST,
                'FILES_data' => $_FILES,
                'php_ini_upload' => array(
                    'file_uploads' => ini_get('file_uploads'),
                    'upload_max_filesize' => ini_get('upload_max_filesize'),
                    'post_max_size' => ini_get('post_max_size'),
                    'max_file_uploads' => ini_get('max_file_uploads'),
                )
            );
            
            // 写入调试文件
            file_put_contents(
                PATH_ROOT . '/upload_debug.log', 
                date('Y-m-d H:i:s') . "\n" . print_r($debug_info, true) . "\n\n", 
                FILE_APPEND
            );
            
            $width = request("width");
            $height = request("height");
            $path = PATH_ROOT . "/static/upload/";
            
            // 确保上传目录存在
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
            
            // 检查是否有文件上传
            if (empty($_FILES)) {
                finish(1, "没有接收到上传文件。调试信息已记录到 upload_debug.log");
            }
            
            $upload = new cls_upload(array(
                "upload_path" => $path,
                "type_limit" => array("jpeg", "jpg", "gif", "png"),
            ));
            $rs = $upload->upload("imgurl");
            if ($rs) {
                if ($width && $height) {
                    $img = new cls_image($path . $rs);
                    $img->thumb2($width, $height, $path . $width . "-" . $height . "-" . $rs);
                }
                finish(0, "", $rs);
            }
            finish(1, "上传失败");
        } catch (Exception $e) {
            $error_msg = $e->getMessage();
            // 提取错误信息（格式：错误代码:::错误消息）
            if (strpos($error_msg, ':::') !== false) {
                $parts = explode(':::', $error_msg);
                $error_msg = isset($parts[1]) ? $parts[1] : $error_msg;
            }
            error_log("Upload error: " . $error_msg);
            finish(1, $error_msg);
        }
    }



    /**
     * saveBase64Img
     * @return string
     */
    public function saveBase64Img($base64_string)
    {
        $PathFormat = "/ffsm/upload/{yyyy}/{time}{rand:6}";   /* 上传保存路径,可以自定义保存路径和文件名格式 */
        $allowFiles = [".png", ".jpg", ".jpeg", ".gif", ".bmp"]; /* 图片格式 */
        $separator = strpos($base64_string, ',');
        $base64_data = substr($base64_string, $separator + 1);
        $img = base64_decode($base64_data);
        $base64Arr = explode(';', $base64_string);
        $contentType = $base64Arr['0'];
        $oriName = '.' . str_replace('data:image/', '', $contentType);
        $fileType = strtolower(strrchr($oriName, '.'));
        if (!in_array($fileType, $allowFiles)) {
            return "Error: 链接contentType不正确";
        }
        $fileSize = strlen($img);       //文件大小
        $fileType = strtolower(strrchr($oriName, '.'));  //文件类型
        $fullName = $this->getFullName($oriName, $PathFormat);   //完整文件名 
        $filePath = $this->getFilePath($fullName);              //完整路径
        $dirname = dirname($filePath);

        //创建目录失败
        if (!file_exists($dirname) && !mkdir($dirname, 0777, true)) {
            return "Error: 目录创建失败";
        } else if (!is_writeable($dirname)) {
            return "Error: 目录没有写权限";
        }
        // 将图片数据保存到文件
        if (!(file_put_contents($filePath, $img) && file_exists($filePath))) {
            //移动失败
            return "写入文件内容错误";
        } else {
            return [
                'file' => $fullName,
                'fileSize' => $fileSize,
                'fileType' => $fileType,
                'filePath' => $filePath
            ];
        }
    }


    /**
     * 获取文件完整路径
     * @return string
     */
    public function getFilePath($fullname)
    {
        $rootPath = $_SERVER['DOCUMENT_ROOT'];
        if (substr($fullname, 0, 1) != '/') {
            $fullname = '/' . $fullname;
        }
        return $rootPath . $fullname;
    }


    /**
     * 重命名文件
     * @return string
     */
    public function getFullName($oriName, $format)
    {
        //替换日期事件
        $t = time();
        $d = explode('-', date("Y-y-m-d-H-i-s"));
        $format = str_replace("{yyyy}", $d[0], $format);
        $format = str_replace("{yy}", $d[1], $format);
        $format = str_replace("{mm}", $d[2], $format);
        $format = str_replace("{dd}", $d[3], $format);
        $format = str_replace("{hh}", $d[4], $format);
        $format = str_replace("{ii}", $d[5], $format);
        $format = str_replace("{ss}", $d[6], $format);
        $format = str_replace("{time}", $t, $format);
        //过滤文件名的非法字符,并替换文件名
        $oriName = preg_replace("/[\|\?\"\<\>\/\*\\\\]+/", '', $oriName);
        $format = str_replace("{filename}", $oriName, $format);
        //替换随机字符串
        $randNum = rand(1, 1000000000) . rand(1, 1000000000);
        if (preg_match("/\{rand\:([\d]*)\}/i", $format, $matches)) {
            $format = preg_replace("/\{rand\:[\d]*\}/i", substr($randNum, 0, $matches[1]), $format);
        }
        $ext = strtolower(strrchr($oriName, '.'));
        return $format . $ext;
    }
}
