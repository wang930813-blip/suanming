<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 推荐板块
 *
 * @version $Id$
 */
include("ctl_ajax.php");

class ctl_recommend
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
        $smurl = db::queryone("SELECT * FROM `system_recommend` WHERE `name` = 'smurl'");
        tpl::assign('web_title', "推荐板块");
        tpl::assign('web_url', $smurl['config']);
        $tb = cls_lurd_control::factory('system_recommend', '?ct=recommend');
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
            $title = $form['title'];
            $row = $tb->get_one(" where `title`='{$title}' ");
            if (is_array($row['data'][0])) {
                cls_msgbox::show('系统提示', '标题已经存在！', '-1');
                exit();
            }
            $data = [];
            if ($form['base64']) {
                $ctl_ajax = new ctl_ajax();
                $imgs = $ctl_ajax->saveBase64Img($form['base64']);
                if ($imgs) {
                    $data['image'] = $imgs['file'];
                }
            }
            $data['title']       = $form['title'];
            $data['url']         = $form['url'];
            $data['description'] = $form['description'];
            db::insert('system_recommend', $data);
            cls_msgbox::show_new('提示', '添加成功！');
            exit();
        }
        //修改
        else if ($even == 'saveedit') {
            $form = req::item('form', '');
            $data = [];
            if ($form['base64']) {
                $ctl_ajax = new ctl_ajax();
                $imgs = $ctl_ajax->saveBase64Img($form['base64']);
                if ($imgs) {
                    $data['image'] = $imgs['file'];
                }
            }
            $data['title']       = $form['title'];
            $data['url']         = $form['url'];
            $data['description'] = $form['description'];
            $where = "id = {$form['id']}";
            db::update('system_recommend', $data, $where);
            cls_msgbox::show_new('提示', '修改成功！');
            exit();
        }
        //自动化操作
        $tb->set_tplfiles('recommend.index.html', 'recommend.add.html', 'recommend.edit.html');
        $tb->listen(req::$forms);
        exit();
    }
}
