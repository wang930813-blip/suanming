-- 为shop_goods表添加home_image字段（首页显示图片）
ALTER TABLE `shop_goods` ADD COLUMN `home_image` varchar(255) NOT NULL DEFAULT '' COMMENT '首页显示图片';
