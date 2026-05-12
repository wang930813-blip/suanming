<?php
/**
 * 专用上传控制器 - Base64方式
 */
class ctl_upload
{
    /**
     * 图片上传页面
     */
    public function image()
    {
        $field = req::item('field', 'image');
        tpl::assign('field', $field);
        tpl::assign('web_title', '上传图片');
        tpl::display('upload.image.html');
    }
    
    /**
     * Base64图片上传
     */
    public function base64()
    {
        header('Content-Type: application/json');
        
        try {
            // 获取Base64数据
            $base64_data = request("imageData");
            
            if (empty($base64_data)) {
                finish(1, "没有接收到图片数据");
            }
            
            // 解析Base64数据
            // 格式: data:image/jpeg;base64,/9j/4AAQSkZJRg...
            if (preg_match('/^data:image\/(\w+);base64,(.+)$/', $base64_data, $matches)) {
                $imageType = strtolower($matches[1]);
                $base64_string = $matches[2];
            } else {
                // 如果没有data:image前缀，直接当作base64字符串
                $base64_string = $base64_data;
                $imageType = 'jpg'; // 默认jpg
            }
            
            // 验证图片类型
            $allowedTypes = array('jpg', 'jpeg', 'png', 'gif');
            if (!in_array($imageType, $allowedTypes)) {
                finish(1, "不支持的图片格式: {$imageType}");
            }
            
            // 解码Base64
            $imageData = base64_decode($base64_string);
            
            if ($imageData === false) {
                finish(1, "Base64解码失败");
            }
            
            // 检查文件大小（限制5MB）
            $fileSize = strlen($imageData);
            $maxSize = 5 * 1024 * 1024; // 5MB
            
            if ($fileSize > $maxSize) {
                finish(1, "图片太大，请压缩后上传（最大5MB）");
            }
            
            if ($fileSize < 100) {
                finish(1, "图片数据异常");
            }
            
            // 验证是否为真正的图片
            $img = @imagecreatefromstring($imageData);
            if ($img === false) {
                finish(1, "不是有效的图片文件");
            }
            imagedestroy($img);
            
            // 生成文件名
            $filename = date('YmdHis') . mt_rand(10000, 99999) . '.' . $imageType;
            
            // 上传目录 - 修改为ffsm/static/upload/
            $uploadPath = PATH_ROOT . "/ffsm/static/upload/";
            
            // 确保目录存在
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }
            
            // 保存文件
            $filePath = $uploadPath . $filename;
            
            if (file_put_contents($filePath, $imageData) === false) {
                finish(1, "文件保存失败");
            }
            
            // 返回成功
            finish(0, "上传成功", $filename);
            
        } catch (Exception $e) {
            finish(1, "上传异常: " . $e->getMessage());
        }
    }
    
    /**
     * 分块上传 - 适合大文件
     */
    public function chunk()
    {
        try {
            $chunk = request("chunk");        // 当前块索引
            $chunks = request("chunks");      // 总块数
            $filename = request("filename");  // 原始文件名
            $data = request("data");          // Base64数据块
            
            if (empty($data)) {
                finish(1, "没有接收到数据块");
            }
            
            // 临时文件路径
            $tempPath = PATH_ROOT . "/data/temp/";
            if (!file_exists($tempPath)) {
                mkdir($tempPath, 0777, true);
            }
            
            $tempFile = $tempPath . md5($filename) . '.tmp';
            
            // 解码并追加数据
            $chunkData = base64_decode($data);
            file_put_contents($tempFile, $chunkData, FILE_APPEND);
            
            // 如果是最后一块，合并并保存
            if ($chunk == $chunks - 1) {
                // 读取完整文件
                $fullData = file_get_contents($tempFile);
                
                // 验证图片
                $img = @imagecreatefromstring($fullData);
                if ($img === false) {
                    @unlink($tempFile);
                    finish(1, "不是有效的图片文件");
                }
                
                // 获取图片信息
                $imageInfo = getimagesizefromstring($fullData);
                $extension = image_type_to_extension($imageInfo[2], false);
                imagedestroy($img);
                
                // 生成最终文件名
                $finalFilename = date('YmdHis') . mt_rand(10000, 99999) . '.' . $extension;
                $uploadPath = PATH_ROOT . "/static/upload/";
                
                if (!file_exists($uploadPath)) {
                    mkdir($uploadPath, 0777, true);
                }
                
                // 移动文件
                $finalPath = $uploadPath . $finalFilename;
                if (!rename($tempFile, $finalPath)) {
                    @unlink($tempFile);
                    finish(1, "文件保存失败");
                }
                
                finish(0, "上传完成", $finalFilename);
            } else {
                // 还有更多块
                finish(0, "块上传成功", array(
                    'chunk' => $chunk,
                    'chunks' => $chunks
                ));
            }
            
        } catch (Exception $e) {
            finish(1, "上传异常: " . $e->getMessage());
        }
    }
}
