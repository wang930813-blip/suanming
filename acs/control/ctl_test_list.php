<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 测算列表管理控制器
 */
class ctl_test_list
{
    public function __construct()
    {
        tpl::assign('web_title', "测算列表管理");
    }

    /**
     * 分类列表
     */
    public function category()
    {
        $action = req::item('action', '');
        
        // 处理删除
        if ($action == 'delete') {
            $this->delete_category();
            return;
        }
        
        // 获取分类列表
        $list = db::get_all("SELECT * FROM `test_category` ORDER BY `sort` ASC, `id` ASC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "测算分类管理");
        tpl::display('test_list.category.html');
    }

    /**
     * 分类表单
     */
    public function category_form()
    {
        $id = req::item('id', 0);
        $data = array();
        
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `test_category` WHERE `id` = " . intval($id));
            if (!$data) {
                cls_msgbox::show('', '分类不存在！', '-1');
            }
        }
        
        tpl::assign('data', $data);
        tpl::assign('web_title', $id > 0 ? "编辑分类" : "新增分类");
        tpl::display('test_list.category_form.html');
    }

    /**
     * 保存分类
     */
    public function save_category()
    {
        $id = req::item('id', 0);
        $name = req::item('name', '');
        $code = req::item('code', '');
        $sort = req::item('sort', 0);
        $status = req::item('status', 1);
        
        // 验证
        if (empty($name)) {
            cls_msgbox::show('', '请输入分类名称！', '-1');
        }
        if (empty($code)) {
            cls_msgbox::show('', '请输入分类代码！', '-1');
        }
        
        // 检查代码是否重复
        $exists = db::get_one("SELECT `id` FROM `test_category` WHERE `code` = '" . db::escape($code) . "' AND `id` != " . intval($id));
        if ($exists) {
            cls_msgbox::show('', '分类代码已存在！', '-1');
        }
        
        $data = array(
            'name' => $name,
            'code' => $code,
            'sort' => intval($sort),
            'status' => intval($status),
            'update_time' => time()
        );
        
        if ($id > 0) {
            // 更新
            db::update('test_category', $data, "`id` = " . intval($id));
            cls_msgbox::show('', '修改成功！', '?ct=test_list&ac=category');
        } else {
            // 新增
            $data['create_time'] = time();
            db::insert('test_category', $data);
            cls_msgbox::show('', '添加成功！', '?ct=test_list&ac=category');
        }
    }

    /**
     * 删除分类
     */
    public function delete_category()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            // 检查是否有关联的测算项目
            $count = db::get_one("SELECT COUNT(*) as num FROM `test_item` WHERE `category_id` = " . intval($id));
            if ($count['num'] > 0) {
                cls_msgbox::show('', '该分类下还有测算项目，无法删除！', '-1');
            }
            
            db::query("DELETE FROM `test_category` WHERE `id` = " . intval($id));
            cls_msgbox::show('', '删除成功！', '?ct=test_list&ac=category');
        }
    }

    /**
     * 测算项目列表
     */
    public function index()
    {
        $action = req::item('action', '');
        
        // 处理删除
        if ($action == 'delete') {
            $this->delete_item();
            return;
        }
        
        // 获取分类列表
        $categories = db::get_all("SELECT * FROM `test_category` ORDER BY `sort` ASC");
        tpl::assign('categories', $categories);
        
        // 获取筛选条件
        $category_id = req::item('category_id', 0);
        
        // 构建查询条件
        $where = "1=1";
        if ($category_id > 0) {
            $where .= " AND `category_id` = " . intval($category_id);
        }
        
        // 获取列表
        $list = db::get_all("SELECT i.*, c.name as category_name FROM `test_item` i LEFT JOIN `test_category` c ON i.category_id = c.id WHERE {$where} ORDER BY i.`category_id` ASC, i.`sort` ASC, i.`id` ASC");
        
        tpl::assign('list', $list);
        tpl::assign('category_id', $category_id);
        tpl::assign('web_title', "测算项目管理");
        tpl::display('test_list.item.html');
    }

    /**
     * 测算项目表单
     */
    public function item_form()
    {
        $id = req::item('id', 0);
        $data = array();
        
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `test_item` WHERE `id` = " . intval($id));
            if (!$data) {
                cls_msgbox::show('', '项目不存在！', '-1');
            }
        }
        
        // 获取分类列表
        $categories = db::get_all("SELECT * FROM `test_category` ORDER BY `sort` ASC");
        
        tpl::assign('data', $data);
        tpl::assign('categories', $categories);
        tpl::assign('web_title', $id > 0 ? "编辑测算项目" : "新增测算项目");
        tpl::display('test_list.item_form.html');
    }

    /**
     * 保存测算项目
     */
    public function save_item()
    {
        $id = req::item('id', 0);
        $category_id = req::item('category_id', 0);
        $title = req::item('title', '');
        $description = req::item('description', '');
        $image = req::item('image', '');
        $link = req::item('link', '');
        $test_count = req::item('test_count', 0);
        $rate = req::item('rate', '0');
        $sort = req::item('sort', 0);
        $status = req::item('status', 1);
        
        // 验证
        if ($category_id <= 0) {
            cls_msgbox::show('', '请选择分类！', '-1');
        }
        if (empty($title)) {
            cls_msgbox::show('', '请输入标题！', '-1');
        }
        if (empty($description)) {
            cls_msgbox::show('', '请输入描述！', '-1');
        }
        if (empty($image)) {
            cls_msgbox::show('', '请上传图片！', '-1');
        }
        if (empty($link)) {
            cls_msgbox::show('', '请输入链接！', '-1');
        }
        
        $data = array(
            'category_id' => intval($category_id),
            'title' => $title,
            'description' => $description,
            'image' => $image,
            'link' => $link,
            'test_count' => intval($test_count),
            'rate' => $rate,
            'sort' => intval($sort),
            'status' => intval($status),
            'update_time' => time()
        );
        
        if ($id > 0) {
            // 更新
            db::update('test_item', $data, "`id` = " . intval($id));
            cls_msgbox::show('', '修改成功！', '?ct=test_list&ac=index');
        } else {
            // 新增
            $data['create_time'] = time();
            db::insert('test_item', $data);
            cls_msgbox::show('', '添加成功！', '?ct=test_list&ac=index');
        }
    }

    /**
     * 删除测算项目
     */
    public function delete_item()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `test_item` WHERE `id` = " . intval($id));
            cls_msgbox::show('', '删除成功！', '?ct=test_list&ac=index');
        }
    }
}
