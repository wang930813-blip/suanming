<?php
/**
 * 短信接口类
 * 
 * 支持：
 * 1. 短信宝 (smsbao) - 传统短信平台
 * 2. Spug推送助手 (spug) - https://push.spug.cc
 * 
 * 注意：
 * 1. 本文件需保存为UTF-8编码（无BOM）
 * 2. 短信内容统一使用UTF-8编码
 */
class mod_sms {
    
    private $provider;
    
    // 短信宝配置
    private $smsbao_username;
    private $smsbao_password;
    
    // Spug配置
    private $spug_template_id;
    
    public function __construct() {
        // 读取短信提供商配置（'smsbao' 或 'spug'）
        $provider_row = db::get_one("SELECT config FROM system WHERE name='sms_provider'");
        $this->provider = ($provider_row && !empty($provider_row['config'])) ? $provider_row['config'] : 'smsbao';
        
        // 读取短信宝配置
        $smsbao_user = db::get_one("SELECT config FROM system WHERE name='sms_username'");
        $this->smsbao_username = ($smsbao_user && !empty($smsbao_user['config'])) ? $smsbao_user['config'] : '';
        $smsbao_pass = db::get_one("SELECT config FROM system WHERE name='sms_password'");
        $this->smsbao_password = ($smsbao_pass && !empty($smsbao_pass['config'])) ? $smsbao_pass['config'] : '';
        
        // 读取Spug配置
        $spug_tpl = db::get_one("SELECT config FROM system WHERE name='spug_template_id'");
        $this->spug_template_id = ($spug_tpl && !empty($spug_tpl['config'])) ? $spug_tpl['config'] : '';
    }
    
    /**
     * 发送短信验证码
     * @param string $mobile 手机号
     * @param string $code 验证码
     * @param int $time 有效时间（分钟），默认5分钟
     * @return array
     */
    public function sendCode($mobile, $code, $time = 5) {
        // 验证手机号格式
        if (!preg_match('/^1[3-9]\d{9}$/', $mobile)) {
            return array('code' => 0, 'msg' => '手机号格式不正确');
        }
        
        // 根据提供商选择发送方式
        if ($this->provider == 'spug') {
            return $this->sendBySpug($mobile, $code);
        } else {
            return $this->sendBySmsbao($mobile, $code, $time);
        }
    }
    
    /**
     * 通过短信宝发送
     */
    private function sendBySmsbao($mobile, $code, $time) {
        if (empty($this->smsbao_username) || empty($this->smsbao_password)) {
            return array('code' => 0, 'msg' => '短信宝配置未设置');
        }
        
        $content = "【三亚狗凯之家源码网】您的验证码为{$code}，在{$time}分钟内有效。";
        
        if (!mb_check_encoding($content, 'UTF-8')) {
            $content = mb_convert_encoding($content, 'UTF-8', 'auto');
        }
        
        $content_encoded = urlencode($content);
        
        $url = 'http://api.smsbao.com/sms?u=' . $this->smsbao_username . '&p=' . md5($this->smsbao_password) . '&m=' . $mobile . '&c=' . $content_encoded;
        
        $response = @file_get_contents($url);
        
        if ($response === '0') {
            return array('code' => 1, 'msg' => '发送成功');
        } else {
            $error_msg = $this->getSmsbaoError($response);
            return array('code' => 0, 'msg' => $error_msg);
        }
    }
    
    /**
     * 通过Spug推送助手发送
     * API: https://push.spug.cc/send/{template_id}?code=XXXX&targets=手机号
     */
    private function sendBySpug($mobile, $code) {
        if (empty($this->spug_template_id)) {
            return array('code' => 0, 'msg' => 'Spug模板ID未配置');
        }
        
        $api_url = 'https://push.spug.cc/send/' . urlencode($this->spug_template_id)
                 . '?code=' . urlencode($code)
                 . '&targets=' . urlencode($mobile);
        
        $response = @file_get_contents($api_url);
        
        if ($response !== false) {
            // Spug成功返回非空，且不是错误信息
            $decoded = json_decode($response, true);
            if ($decoded && isset($decoded['error'])) {
                return array('code' => 0, 'msg' => 'Spug发送失败：' . $decoded['error']);
            }
            return array('code' => 1, 'msg' => '发送成功');
        } else {
            return array('code' => 0, 'msg' => 'Spug发送失败：网络请求异常');
        }
    }
    
    /**
     * 短信宝错误码解析
     */
    private function getSmsbaoError($code) {
        $errors = array(
            '30' => '密码错误',
            '40' => '账号不存在',
            '41' => '余额不足',
            '43' => 'IP地址限制',
            '50' => '内容含有敏感词',
            '51' => '手机号码不正确',
        );
        return isset($errors[$code]) ? $errors[$code] : '发送失败：' . $code;
    }
    
    /**
     * 生成验证码
     * @param int $length 长度
     * @return string
     */
    public static function generateCode($length = 4) {
        return str_pad(mt_rand(0, pow(10, $length) - 1), $length, '0', STR_PAD_LEFT);
    }
    
    /**
     * 保存验证码到数据库
     * @param string $mobile 手机号
     * @param string $code 验证码
     * @param int $expire_minutes 有效期（分钟），默认5分钟
     */
    public static function saveCode($mobile, $code, $expire_minutes = 5) {
        $now = time();
        $expire_time = $now + ($expire_minutes * 60);
        $ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
        
        db::query("DELETE FROM `sms_verify_codes` WHERE `mobile`='" . addslashes($mobile) . "' AND `used`=0");
        
        $data = array(
            'mobile' => $mobile,
            'code' => $code,
            'create_time' => $now,
            'expire_time' => $expire_time,
            'used' => 0,
            'ip' => $ip
        );
        
        db::insert('sms_verify_codes', $data);
        
        file_put_contents(PATH_ROOT.'/sms_code_debug.log', 
            date('Y-m-d H:i:s') . " - 保存验证码到数据库\n" .
            "手机号: {$mobile}\n" .
            "验证码: {$code}\n" .
            "过期时间: " . date('Y-m-d H:i:s', $expire_time) . "\n\n",
            FILE_APPEND
        );
    }
    
    /**
     * 验证短信验证码（从数据库）
     * @param string $mobile 手机号
     * @param string $code 验证码
     * @return bool
     */
    public static function verifyCode($mobile, $code) {
        $now = time();
        
        file_put_contents(PATH_ROOT.'/sms_code_debug.log', 
            date('Y-m-d H:i:s') . " - 从数据库验证验证码\n" .
            "手机号: {$mobile}\n" .
            "输入验证码: {$code}\n",
            FILE_APPEND
        );
        
        $query = "SELECT * FROM `sms_verify_codes` 
                  WHERE `mobile`='" . addslashes($mobile) . "' 
                  AND `code`='" . addslashes($code) . "' 
                  AND `used`=0 
                  AND `expire_time`>={$now} 
                  ORDER BY `create_time` DESC 
                  LIMIT 1";
        
        $row = db::get_one($query);
        
        if (!$row) {
            file_put_contents(PATH_ROOT.'/sms_code_debug.log', 
                "结果: 验证码不存在、已使用或已过期\n\n",
                FILE_APPEND
            );
            return false;
        }
        
        db::query("UPDATE `sms_verify_codes` SET `used`=1 WHERE `id`=" . intval($row['id']));
        
        file_put_contents(PATH_ROOT.'/sms_code_debug.log', 
            "数据库记录ID: {$row['id']}\n" .
            "创建时间: " . date('Y-m-d H:i:s', $row['create_time']) . "\n" .
            "过期时间: " . date('Y-m-d H:i:s', $row['expire_time']) . "\n" .
            "结果: 验证成功 ✓\n\n",
            FILE_APPEND
        );
        
        return true;
    }
}
