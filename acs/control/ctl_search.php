<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 搜索板块
 *
 * @version $Id$
 */
 
class ctl_search
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
     * 搜索跳转
     */
    public function index()
    {
        $smurl = db::queryone("SELECT * FROM `system` WHERE `name` = 'smurl'");
        tpl::assign('web_title', "搜索匹配关键词");
        tpl::assign('web_url', $smurl['config']);
        $tb = cls_lurd_control::factory('system_search', '?ct=search');
        $tb->set_list_config("*", "order by id desc");  //追加手动查询条件
        //用户上次登录时间、IP信息
        $even = req::item('even', ''); //'事件':用户'添加'、'修改'、'删除'？
        if ($even == 'edit') //"编辑"
        {
            $last_login = cls_access::get_login_infos(req::item('uid', 0)); //获得用户上次登录时间和ip
            tpl::assign('last_login', $last_login);
        }
        //保存新增用户事件前处理
        else if ($even == 'saveadd') {
            $form = req::item('form');
            if (!$form['title'] || !$form['url'] || !$form['system_name']) {
                cls_msgbox::show('系统提示', '必填项不能为空', '-1');
                exit();
            }
            $data['title']       = $form['title'];
            $data['url']         = $form['url'];
            $data['system_name'] = $form['system_name'];
            $data['createtime']  = time();
            db::insert('system_search', $data);
            cls_msgbox::show_new('提示', '添加成功！');
            exit();
        }
        //修改
        else if ($even == 'saveedit') {
            $form = req::item('form', '');
            if (!$form['title'] || !$form['url'] || !$form['system_name']) {
                cls_msgbox::show('系统提示', '必填项不能为空', '-1');
                exit();
            }
            $data['title']       = $form['title'];
            $data['url']         = $form['url'];
            $data['system_name'] = $form['system_name'];
            $where = "id = {$form['id']}";
            db::update('system_search', $data, $where);
            cls_msgbox::show_new('提示', '修改成功！');
            exit();
        }
        //自动化操作
        $tb->set_tplfiles('search.index.html', 'search.add.html', 'search.edit.html');
        $tb->listen(req::$forms);
        exit();
    }
        /**
     * 搜索日志
     */
    public function log()
    {
        $smurl = db::queryone("SELECT * FROM `system` WHERE `name` = 'smurl'");
        tpl::assign('web_title', "搜索记录");
        tpl::assign('web_url', $smurl['config']);
        $tb = cls_lurd_control::factory('system_search_log', '?ct=search&ac=log');
        $tb->set_list_config("*", "order by id desc");  //追加手动查询条件
        //自动化操作
        $tb->set_tplfiles('searchlog.index.html', 'searchlog.add.html', 'searchlog.edit.html');
        $tb->listen(req::$forms);
        exit();
    }
}
