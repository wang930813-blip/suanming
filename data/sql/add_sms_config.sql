-- 添加短信宝配置到系统基本配置
-- 在后台系统基本配置中显示

-- 短信宝配置（一次性插入）
INSERT INTO `system` (`name`, `config`, `title`, `class`, `zhushi`) VALUES 
('sms_username', '', '短信宝用户名', 0, '短信宝API用户名'),
('sms_password', '', '短信宝密码', 0, '短信宝API密码（原始密码）'),
('sms_goods_id', '', '短信宝产品ID(可选)', 0, '专用通道产品ID，不使用可留空');

-- 如果记录已存在，使用以下语句更新：
-- UPDATE `system` SET `config`='', `title`='短信宝用户名', `class`=0 WHERE `name`='sms_username';
-- UPDATE `system` SET `config`='', `title`='短信宝密码', `class`=0 WHERE `name`='sms_password';
-- UPDATE `system` SET `config`='', `title`='短信宝产品ID(可选)', `class`=0 WHERE `name`='sms_goods_id';
