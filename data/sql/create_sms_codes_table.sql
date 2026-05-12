-- 创建短信验证码表
CREATE TABLE IF NOT EXISTS `sms_verify_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `expire_time` int(11) NOT NULL COMMENT '过期时间',
  `used` tinyint(1) DEFAULT '0' COMMENT '是否已使用 0未使用 1已使用',
  `ip` varchar(50) DEFAULT NULL COMMENT '请求IP',
  PRIMARY KEY (`id`),
  KEY `idx_mobile` (`mobile`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信验证码表';
