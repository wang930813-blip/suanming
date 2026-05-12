<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 测算列表前端控制器
 */
class ctl_test_list
{
    public function index()
    {
        // 获取所有分类
        $categories = db::get_all("SELECT * FROM `test_category` WHERE `status` = 1 ORDER BY `sort` ASC, `id` ASC");
        
        // 获取每个分类下的测算项目
        $test_data = array();
        foreach ($categories as $category) {
            $items = db::get_all("SELECT * FROM `test_item` WHERE `category_id` = {$category['id']} AND `status` = 1 ORDER BY `sort` ASC, `id` ASC");
            $test_data[$category['code']] = array(
                'category' => $category,
                'items' => $items
            );
        }
        
        tpl::assign('categories', $categories);
        tpl::assign('test_data', $test_data);
        tpl::assign('web_title', '测算集合页');
        tpl::display('ffsm/list.tpl');
    }
}
