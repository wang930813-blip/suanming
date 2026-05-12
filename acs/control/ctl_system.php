<?php
if( !defined('CORE') ) exit('Request Error!');
/**
 * 用户管理
 *
 * @version $Id$
 */
class ctl_system
{
   
   /**
    * 控制器的构造函数(可放一些全局初始化东西)
    * @return void
    */
    public function __construct()
    {
        tpl::assign('cfg_groups', cls_access::$cfg_groups); //用户权限配置文件读取的数据：取得users_purview_config表中purview_xml字段值,并转化为php数组
		
    }
   
   /**
    * 管理员帐号管理
    */
    public function index()
    {
        tpl::assign('web_title', "系统基本配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();

        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=0'));
            $pay_type  = db::fetch_one(db::query('SELECT * FROM `system` where `name`="pay_type"'));

            $configArr =   explode(',', $pay_type['config']);
            $payMethod =[];
            foreach ($configArr as $key => $value) {
                if($value ==0){
                    $payMethod['all'] = 1;
                }
                else if($value ==1){
                    $payMethod['wechat'] = 1;
                }
                else if($value ==2){
                    $payMethod['alipay'] = 1;
                }
                else if($value ==4){
                    $payMethod['other'] = 1;
                }
                else if($value ==5){
                    $payMethod['paypal'] = 1;
                }
                else if($value ==6){
                    $payMethod['stripe'] = 1;
                }
            }
             
            tpl::assign('payMethod', $payMethod);
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "index");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            $sys_config = req::item('sys', '');
            
            // 处理支付方式
            $pay_types = array();
            if(isset($sys_config['pay_type'])) {
                foreach($sys_config['pay_type'] as $type => $value) {
                    $pay_types[] = $type;
                }
            }
            $sys_config['pay_type'] = array(
                0 => implode(',', $pay_types),
                1 => '显示支付方式',
                2 => 0
            );
            
            // 使用update而不是replace into
            foreach($sys_config as $key=>$sys_vel){
                $data = [
                    'config' => $sys_vel[0],
                    'title' => $sys_vel[1],
                    'class' => $sys_vel[2]
                ];
                $where = "name ='{$key}'";
                db::update('system', $data, $where);
            }
            
            Cache::del('paypal', 'tokens');
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=index');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
   public function index_m()
    {
        tpl::assign('web_title', "测算价格配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();
		
        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=1'));
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "index_m");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            $sys_config = req::item('sys', '');
			$sys_vl ="";
			$k=0;
			foreach($sys_config as $key=>$sys_vel){
                $data = [
                    'config' => $sys_vel[0],
                ];
                $where = "name ='{$key}' " ;
                db::update('system', $data, $where);
			}
            //db::query("Replace Into `system` (`name`, `config`,`title`,`class`) VALUES ".$sys_vl);
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=index_m');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
   public function index_a()
    {
        tpl::assign('web_title', "系统信息配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();
		
        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=2'));
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "index_a");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            
            $sys_config = req::item('sys', '');
			$sys_vl ="";
			$k=0;
			foreach($sys_config as $key=>$sys_vel){
				if($k>=1){
					$sys_vl.=",";
				}
				$sys_vl.="('".$key."', '".$sys_vel[0]."','".$sys_vel[1]."','".$sys_vel[2]."')";
				$k++;
			}
            db::query("Replace Into `system` (`name`, `config`,`title`,`class`) VALUES ".$sys_vl);
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=index_a');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
	public function integral()
    {
        tpl::assign('web_title', "推广积分配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();
		
        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=4'));
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "integral");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            
            $sys_config = req::item('sys', '');
			$sys_vl ="";
			$k=0;
			foreach($sys_config as $key=>$sys_vel){
				if($k>=1){
					$sys_vl.=",";
				}
				$sys_vl.="('".$key."', '".$sys_vel[0]."','".$sys_vel[1]."','".$sys_vel[2]."')";
				$k++;
			}
            db::query("Replace Into `system` (`name`, `config`,`title`,`class`) VALUES ".$sys_vl);
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=integral');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
   public function index_b()
    {
        tpl::assign('web_title', "代理分成配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();
		
        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=3'));
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "index_a");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            
            $sys_config = req::item('sys', '');
			$sys_vl ="";
			$k=0;
			foreach($sys_config as $key=>$sys_vel){
				if($k>=1){
					$sys_vl.=",";
				}
				$sys_vl.="('".$key."', '".$sys_vel[0]."','".$sys_vel[1]."','".$sys_vel[2]."')";
				$k++;
			}
            db::query("Replace Into `system` (`name`, `config`,`title`,`class`) VALUES ".$sys_vl);
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=index_a');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
   public function index_d()
    {
        tpl::assign('web_title', "VIP价格配置");
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $even = req::item('even', '');
        $acc_ctl = cls_access::get_instance();
		
        //修改具体组
        if( $even == '' )
        {
			$sys_all=db::fetch_all(db::query('SELECT * FROM `system` where `class`=5'));
           tpl::assign('sys_all', $sys_all);
          tpl::assign('ac_url', "index_d");
        }
        //保存修改
        else if( $even == 'saveedit' )
        {
            
            $sys_config = req::item('sys', '');
			$sys_vl ="";
			$k=0;
			foreach($sys_config as $key=>$sys_vel){
				if($k>=1){
					$sys_vl.=",";
				}
				$sys_vl.="('".$key."', '".$sys_vel[0]."','".$sys_vel[1]."','".$sys_vel[2]."')";
				$k++;
			}
            db::query("Replace Into `system` (`name`, `config`,`title`,`class`) VALUES ".$sys_vl);
            cls_msgbox::show('系统提示', '保存成功！', '?ct=system&ac=index_d');
            exit();
        }
        tpl::display('system.html');
        exit();
    }
}
