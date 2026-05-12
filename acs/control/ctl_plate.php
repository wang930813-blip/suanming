<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 板块管理 
 *
 * @version $Id$
 */
class ctl_plate
{

    /**
     * 控制器的构造函数(可放一些全局初始化东西)
     * @return void
     */
    public function __construct()
    {
        tpl::assign('cfg_groups', cls_access::$cfg_groups);
    }

    /**
     * 管理员帐号管理
     */
    public function index()
    {
        $smurl = db::queryone("SELECT * FROM `system` WHERE `name` = 'smurl'");
        tpl::assign('web_title', "功能板块");
        tpl::assign('web_url', $smurl['config']);
        $tb = cls_lurd_control::factory('system', '?ct=plate'); //把表名映射成类的工厂方法
        $tb->add_search_condition("class = 1");  //追加手动查询条件
        //用户上次登录时间、IP信息
        $even = req::item('even', ''); //'事件':用户'添加'、'修改'、'删除'？
        if ($even == 'edit') //"编辑"
        {
            $last_login = cls_access::get_login_infos(req::item('uid', 0)); //获得用户上次登录时间和ip
            tpl::assign('last_login', $last_login);
        }
        //修改
        else if ($even == 'saveedit') {
            $form = req::item('form', '');
            $data = [
                'title' => $form['title'],
                'seotitle' => $form['seotitle'],
                'keywords' => $form['keywords'],
                'description' => $form['description'],
            ];
            $where = "name ='{$form['name']}' " ;
            db::update('system', $data, $where);
            cls_msgbox::show_new('提示', '修改成功！');
            exit();
        }
        //添加推荐
        else if ($even == 'recommend') {
            $name = req::item('name', '');
            $row = db::queryone("SELECT * FROM `system` WHERE `name` = '{$name }'");
            $data = [
                'system_name' => $row['name'],
                'title' => $row['title'],
                'description' => $row['description'],
                'url' => "/?ac=".$row['name'],
            ];
            db::insert('system_recommend', $data);
            cls_msgbox::show('提示', '添加完成！','?ct=recommend&ac=index');
            exit();
        }


        //自动化操作
        $tb->bind_type('logintime', 'TIMESTAMP');
        $tb->set_tplfiles('plate.index.html', 'plate.add.html', 'plate.edit.html');
        $tb->listen(req::$forms);
        exit();
    }
}
