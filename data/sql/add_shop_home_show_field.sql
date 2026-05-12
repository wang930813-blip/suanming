-- 为shop_goods表添加is_home_show字段（显示在首页）
ALTER TABLE `shop_goods` ADD COLUMN `is_home_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示在首页 0=否 1=是';

-- 为字段添加索引，提高查询速度
CREATE INDEX `idx_home_show` ON `shop_goods` (`is_home_show`, `sort`);
