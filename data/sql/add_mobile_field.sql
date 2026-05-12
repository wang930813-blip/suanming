-- 为users表添加mobile字段（不指定位置，避免email字段不存在导致失败）
ALTER TABLE `users` ADD COLUMN `mobile` varchar(11) DEFAULT '' COMMENT '手机号';

-- 为mobile字段添加索引，提高查询速度
CREATE INDEX `idx_mobile` ON `users` (`mobile`);
