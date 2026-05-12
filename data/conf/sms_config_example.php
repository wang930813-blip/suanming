<?php
/**
 * 短信宝配置示例
 * 请将此文件复制为 sms_config.php 并填写您的短信宝账号信息
 * 在 include/config.inc.php 中添加以下代码：
 * 
 * // 短信配置
 * require_once PATH_ROOT . '/data/conf/sms_config.php';
 */

// 短信宝配置
$GLOBALS['config']['sms'] = [
    // 短信宝用户名
    'username' => '',
    
    // 短信宝密码（原始密码，系统会自动MD5加密）
    'password' => '',
    
    // 可选：产品ID（如果使用专用通道）
    'goods_id' => '',
];

/**
 * 配置说明：
 * 
 * 1. 注册短信宝账号：https://www.smsbao.com/
 * 2. 登录后台获取API账号和密码
 * 3. 将账号密码填写到上方配置中
 * 4. 确保账户有足够余额
 * 
 * 接口文档：http://www.smsbao.com/openapi/
 * 
 * 注意事项：
 * - 短信内容需要包含签名，如：【您的站点】验证码XXXX
 * - 请勿发送违规内容
 * - 建议设置图形验证码防止短信轰炸
 * - 建议设置发送频率限制（已在代码中实现60秒限制）
 */
