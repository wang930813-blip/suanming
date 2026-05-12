<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 首页内容管理控制器
 */
class ctl_home_content
{
    public function __construct()
    {
        tpl::assign('web_title', "首页内容管理");
    }

    /**
     * Banner轮播图管理
     */
    public function banner()
    {
        $action = req::item('action', '');
        
        // 处理添加/编辑/删除
        if ($action == 'save') {
            $this->save_banner();
            return;
        } elseif ($action == 'delete') {
            $this->delete_banner();
            return;
        }
        
        // 获取列表
        $list = db::get_all("SELECT * FROM `home_banner` ORDER BY `sort` ASC, `id` DESC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "Banner轮播图管理");
        tpl::display('home_content.banner.html');
    }

    /**
     * Banner表单页面
     */
    public function banner_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `home_banner` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.banner_form.html');
    }

    /**
     * 保存Banner
     */
    private function save_banner()
    {
        $id = req::item('id', 0);
        $data = array(
            'title' => req::item('title', ''),
            'image' => req::item('image', ''),
            'link' => req::item('link', ''),
            'sort' => req::item('sort', 0),
            'status' => req::item('status', 1),
        );
        
        if ($id > 0) {
            db::update('home_banner', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            db::insert('home_banner', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=home_content&ac=banner');
    }

    /**
     * 删除Banner
     */
    private function delete_banner()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `home_banner` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=banner');
    }

    /**
     * 本周热门管理
     */
    public function hot()
    {
        $action = req::item('action', '');
        
        if ($action == 'save') {
            $this->save_hot();
            return;
        } elseif ($action == 'delete') {
            $this->delete_hot();
            return;
        }
        
        $list = db::get_all("SELECT * FROM `home_hot` ORDER BY `sort` ASC, `id` DESC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "本周热门管理");
        tpl::display('home_content.hot.html');
    }

    /**
     * 本周热门表单页面
     */
    public function hot_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `home_hot` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.hot_form.html');
    }

    private function save_hot()
    {
        $id = req::item('id', 0);
        $data = array(
            'title' => req::item('title', ''),
            'image' => req::item('image', ''),
            'link' => req::item('link', ''),
            'sort' => req::item('sort', 0),
            'status' => req::item('status', 1),
        );
        
        if ($id > 0) {
            db::update('home_hot', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            db::insert('home_hot', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=home_content&ac=hot');
    }

    private function delete_hot()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `home_hot` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=hot');
    }

    /**
     * 每月特辑管理 - 已废弃，改为使用商城商品显示
     * 如需恢复，请取消注释以下代码
     */
    /*
    public function special()
    {
        $action = req::item('action', '');
        
        if ($action == 'save') {
            $this->save_special();
            return;
        } elseif ($action == 'delete') {
            $this->delete_special();
            return;
        }
        
        $list = db::get_all("SELECT * FROM `home_special` ORDER BY `sort` ASC, `id` DESC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "每月特辑管理");
        tpl::display('home_content.special.html');
    }

    public function special_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `home_special` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.special_form.html');
    }

    private function save_special()
    {
        $id = req::item('id', 0);
        $data = array(
            'title' => req::item('title', ''),
            'image' => req::item('image', ''),
            'link' => req::item('link', ''),
            'old_price' => req::item('old_price', ''),
            'new_price' => req::item('new_price', ''),
            'sort' => req::item('sort', 0),
            'status' => req::item('status', 1),
        );
        
        if ($id > 0) {
            db::update('home_special', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            db::insert('home_special', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=home_content&ac=special');
    }

    private function delete_special()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `home_special` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=special');
    }
    */

    /**
     * 精品推荐管理
     */
    public function recommend()
    {
        $action = req::item('action', '');
        
        if ($action == 'save') {
            $this->save_recommend();
            return;
        } elseif ($action == 'delete') {
            $this->delete_recommend();
            return;
        }
        
        $list = db::get_all("SELECT * FROM `home_recommend` ORDER BY `sort` ASC, `id` DESC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "精品推荐管理");
        tpl::display('home_content.recommend.html');
    }

    /**
     * 精品推荐表单页面
     */
    public function recommend_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `home_recommend` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.recommend_form.html');
    }

    private function save_recommend()
    {
        $id = req::item('id', 0);
        $data = array(
            'title' => req::item('title', ''),
            'description' => req::item('description', ''),
            'image' => req::item('image', ''),
            'link' => req::item('link', ''),
            'test_count' => req::item('test_count', 0),
            'rate' => req::item('rate', '98%'),
            'type' => req::item('type', 1), // 1=精品推荐 2=新品尝鲜
            'sort' => req::item('sort', 0),
            'status' => req::item('status', 1),
        );
        
        if ($id > 0) {
            db::update('home_recommend', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            db::insert('home_recommend', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=home_content&ac=recommend');
    }

    private function delete_recommend()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `home_recommend` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=recommend');
    }

    /**
     * 首页产品管理
     */
    public function products()
    {
        $action = req::item('action', '');
        
        // 处理保存
        if ($action == 'save') {
            $this->save_products();
            return;
        }
        
        // 处理删除
        if ($action == 'delete') {
            $this->delete_products();
            return;
        }
        
        // 获取列表
        $list = db::get_all("SELECT * FROM `home_products` ORDER BY `sort` ASC, `id` ASC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "首页产品管理");
        tpl::display('home_content.products.html');
    }

    /**
     * 产品表单页面
     */
    public function products_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `home_products` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.products_form.html');
    }

    /**
     * 保存产品
     */
    private function save_products()
    {
        $id = req::item('id', 0);
        $title = req::item('title', '');
        $image = req::item('image', '');
        $link = req::item('link', '');
        $sort = req::item('sort', 0);
        $status = req::item('status', 1);

        if (empty($title) || empty($image) || empty($link)) {
            cls_msgbox::show('', '请填写完整信息！', 'javascript:history.back();');
            return;
        }

        $data = array(
            'title' => $title,
            'image' => $image,
            'link' => $link,
            'sort' => intval($sort),
            'status' => intval($status)
        );

        if ($id > 0) {
            db::update('home_products', $data, "id={$id}");
            $msg = '更新成功！';
        } else {
            db::insert('home_products', $data);
            $msg = '添加成功！';
        }

        cls_msgbox::show('', $msg, '?ct=home_content&ac=products');
    }

    /**
     * 删除产品
     */
    private function delete_products()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `home_products` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=products');
    }

    /**
     * 猜你喜欢管理
     */
    public function like()
    {
        $action = req::item('action', '');
        
        // 处理保存
        if ($action == 'save') {
            $this->save_like();
            return;
        }
        
        // 处理删除
        if ($action == 'delete') {
            $this->delete_like();
            return;
        }
        
        // 获取列表
        $list = db::get_all("SELECT * FROM `system_recommend` ORDER BY `id` DESC");
        tpl::assign('list', $list);
        tpl::assign('web_title', "猜你喜欢管理");
        tpl::display('home_content.like.html');
    }

    /**
     * 猜你喜欢表单页面
     */
    public function like_form()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            $data = db::get_one("SELECT * FROM `system_recommend` WHERE id={$id}");
            tpl::assign('data', $data);
        }
        tpl::display('home_content.like_form.html');
    }

    /**
     * 保存猜你喜欢
     */
    private function save_like()
    {
        $id = req::item('id', 0);
        $title = req::item('title', '');
        $image = req::item('image', '');
        $url = req::item('url', '');
        $description = req::item('description', '');

        if (empty($title) || empty($image) || empty($url)) {
            cls_msgbox::show('', '请填写完整信息！', 'javascript:history.back();');
            return;
        }

        $data = array(
            'title' => $title,
            'image' => $image,
            'url' => $url,
            'description' => $description
        );

        if ($id > 0) {
            db::update('system_recommend', $data, "id={$id}");
            $msg = '更新成功！';
        } else {
            db::insert('system_recommend', $data);
            $msg = '添加成功！';
        }

        cls_msgbox::show('', $msg, '?ct=home_content&ac=like');
    }

    /**
     * 删除猜你喜欢
     */
    private function delete_like()
    {
        $id = req::item('id', 0);
        if ($id > 0) {
            db::query("DELETE FROM `system_recommend` WHERE id={$id}");
        }
        cls_msgbox::show('', '删除成功！', '?ct=home_content&ac=like');
    }
}
