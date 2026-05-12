
<?php

if (!defined('CORE'))   exit('Request Error!');
class ctl_index {

    public function checkorder($go,$en,$uid){


        /*
        $sql = 'select * from `ffsm_orders` where status=1 and paytime>'.$go.' and paytime<'.$en;
        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where  createtime>'.$go.' and createtime<'.$en;
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and createtime>'.$go.' and createtime<'.$en;
        $numpay = db::queryone($sqli);


        $sql = 'select * from `ffsm_orders` where status=1 and paytime like "'.date('Y-m-d',$go).'%"';
        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where  createtime like "'.date('Y-m-d',$go).'%"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and createtime like "'.date('Y-m-d',$go).'%"';
        $numpay = db::queryone($sqli);
        */

        $sql = 'select * from `ffsm_orders` where status=1 and uid="'.$uid.'" and createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'"  and status=1 ' ;


        $row = db::querylist($sql);

        $sql = 'select count(id) as num from `ffsm_orders` where uid="'.$uid.'" and  createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and uid="'.$uid.'" and  createtime>"'.strtotime(date('Y-m-d H:i:s',$go)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$en)).'" and status=1 ';
        
        $numpay = db::queryone($sqli);

        $total = 0;
        foreach($row as $k=>$v){
            $total = $total+$v['money'];
        }

        $data['numall'] = $numall['num'];
        $data['numpay'] = $numpay['num'];

        $bili = $data['numpay']/$data['numall']*100;
        $bili==''?$bili=0:$bili=$bili;

        $data['bili'] = round($bili,2).'%';
        $data['total'] = $total;


        return $data;
    }
    /**
     * 主入口
     */
    public function index() {
        tpl::assign('web_title', "首页概况总览");
        
        global $config;
        require(PATH_CONFIG.'/inc_groups_name.php');
        $acc_ctl = cls_access::get_instance();
      	$sql1 = "SELECT * FROM `users` WHERE uid ='".$acc_ctl->fields['uid']."'";
		$rsid = db::fetch_one(db::query($sql1));
        $groups = cls_access_cfg::get_acc_groups($acc_ctl->fields['uid'], 'admin', $acc_ctl->fields['groups']);
     
        tpl::assign('users',$rsid);
        tpl::assign('groups', $groups);
        tpl::assign('config_apps', $config['apps']);
        
        $userinfo = cls_access::$accctl->get_userinfos();
        $uid = ($userinfo['uid']);

        //今天
        $beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
        $endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $data['total_today'] = self::checkorder($beginToday,$endToday,$uid);
        $data['total_today']['lirun'] = $data['total_today']['total']*('0.'.$userinfo['dl_tcbl']);

        //昨天
        $beginYesterday=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $endYesterday=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $data['total_yesterday'] = self::checkorder($beginYesterday,$endYesterday,$uid);
        $data['total_yesterday']['lirun'] = $data['total_yesterday']['total']*('0.'.$userinfo['dl_tcbl']);


        //本月
        $beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
        $endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
        $data['total_smonth'] = self::checkorder($beginThismonth,$endThismonth,$uid);
        $data['total_smonth']['lirun'] = $data['total_smonth']['total']*('0.'.$userinfo['dl_tcbl']);


        $sql = 'select `money` from `ffsm_orders` where status=1 and paytype<>3  and uid="'.$uid.'"';
        $row =  db::querylist($sql);
        $total = 0;
        foreach($row as $k=>$v){
            $total = $total+$v['money'];
        }

        $sql = 'select count(id) as num from `ffsm_orders`  where uid="'.$uid.'"';
        $numall = db::queryone($sql);

        $sqli = 'select count(id) as num from `ffsm_orders` where status=1 and paytype<>3  and uid="'.$uid.'"';
        $numpay = db::queryone($sqli);

        $data['total']['total'] = $total;
        $data['total']['numall'] = $numall['num'];
        $data['total']['numpay'] = $numpay['num'];
        $bili = $data['total']['numpay']/$data['total']['numall']*100;
        $bili==''?$bili=0:$bili=$bili;

        $data['total']['bili'] = round($bili,2).'%';
        $data['total']['lirun'] = $data['total']['total']*('0.'.$userinfo['dl_tcbl']);


        //历史

        tpl::assign('data',$data);
		
		
		//--------------------------------------------------
		
		if($uid==1){
		
			//全部
			$sql_all = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where paytype<>3 GROUP BY `status`';
			$row_all =  db::querylist($sql_all);
			
			$row_alls=array();
			foreach($row_all as $kk=>$vv){
				if($vv['status']==1){
					$row_alls['s_money']+=$vv['money_sum'];
					$row_alls['s_count']+=$vv['con'];
				}
				else{
					$row_alls['f_count']+=$vv['con'];
				}
				$row_alls['all_money']+=$vv['money_sum'];
			}
			$row_alls['wcl']=round($row_alls['s_count']/($row_alls['s_count']+$row_alls['f_count'])*100,2)."%";
			
			tpl::assign('row_alls',$row_alls);

			
			//今天
			$beginToday=mktime(0,0,0,date('m'),date('d'),date('Y'));
			$endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
			$sql_Today = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginToday)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endToday)).'" and paytype<>3 GROUP BY `status`';
			$row_Today =  db::querylist($sql_Today);
			
			$row_Todays=array();
			foreach($row_Today as $kk=>$vv){
				if($vv['status']==1){
					$row_Todays['s_money']+=$vv['money_sum'];
					$row_Todays['s_count']+=$vv['con'];
				}
				else{
					$row_Todays['f_count']+=$vv['con'];
				}
				$row_Todays['all_money']+=$vv['money_sum'];
			}
			$row_Todays['wcl']=round($row_Todays['s_count']/($row_Todays['s_count']+$row_Todays['f_count'])*100,2)."%";
			tpl::assign('row_Todays',$row_Todays);
			
			//昨天
			$beginYesterday=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
			$endYesterday=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
			$sql_Yesterday = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginYesterday)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endYesterday)).'" and paytype<>3 GROUP BY `status`';
			$row_Yesterday =  db::querylist($sql_Yesterday);
			
			$row_Yesterdays=array();
			foreach($row_Yesterday as $kk=>$vv){
				if($vv['status']==1){
					$row_Yesterdays['s_money']+=$vv['money_sum'];
					$row_Yesterdays['s_count']+=$vv['con'];
				}
				else{
					$row_Yesterdays['f_count']+=$vv['con'];
				}
				$row_Yesterdays['all_money']+=$vv['money_sum'];
			}
			$row_Yesterdays['wcl']=round($row_Yesterdays['s_count']/($row_Yesterdays['s_count']+$row_Yesterdays['f_count'])*100,2)."%";
			tpl::assign('row_Yesterdays',$row_Yesterdays);
			
			
			//本月
			$beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
			$endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
			$sql_Thismonth = 'select *,sum(`money`) as money_sum,count(status) as con from `ffsm_orders` where createtime>"'.strtotime(date('Y-m-d H:i:s',$beginThismonth)).'" and createtime<"'.strtotime(date('Y-m-d H:i:s',$endThismonth)).'" and paytype<>3 GROUP BY `status`';
			$row_Thismonth =  db::querylist($sql_Thismonth);
			
			$row_Thismonths=array();
			foreach($row_Thismonth as $kk=>$vv){

				if($vv['status']==1){
					$row_Thismonths['s_money']+=$vv['money_sum'];
					$row_Thismonths['s_count']+=$vv['con'];
				}
				else{
					$row_Thismonths['f_count']+=$vv['con'];
				}
				$row_Thismonths['all_money']+=$vv['money_sum'];
			}
			$row_Thismonths['wcl']=round($row_Thismonths['s_count']/($row_Thismonths['s_count']+$row_Thismonths['f_count'])*100,2)."%";
			tpl::assign('row_Thismonths',$row_Thismonths);
			
			
		}

        

        tpl::assign('userinfo',$userinfo);
        
        
        
        $t1 = microtime(true);
        $menu = preg_replace('/,$/', '', mod_admin_menu::parse_menu());
        tpl::assign('menu', $menu); 
        tpl::assign('user', cls_access::$accctl->get_userinfos());
        tpl::display('index.html');
        exit();
        
        
    }

    /**
     * 用户登录
     */
    public function login() {
		if(req::item('reg', '')==1){
			$this->registered();
		}else{
        $accctl = cls_access::get_instance();
        $rs = 0;
        $errmsg = '';
        $gourl = req::item('gourl', '');
        if (req::item('username', '') != '' && req::item('password', '') != '') {
            try {
                $rs = $accctl->check_user(req::item('username'), req::item('password'));
                if ($rs == 1) {
                    $jumpurl = empty($gourl) ? '?ct=index&ac=index' : $gourl;
                    cls_access::show_message('成功登录', '成功登录，正在重定向你访问的页面', $jumpurl);
                    exit();
                }
            } catch (Exception $e) {
                $errmsg = 'Error：' . $e->getMessage();
            } 
        }
        tpl::assign('gourl', $gourl);
        tpl::assign('errmsg', $errmsg);
        tpl::display('login.html');
        exit();
		}
    }
   /**
     * 用户注册
     */
   public function registered() {
    
     	 $gourl = req::item('gourl', '');
		$jumpurl = empty($gourl) ? '?ct=index&ac=login' : $gourl;
		if ( req::item('yzm', '') != $_COOKIE['scode'] ) {
          cls_access::show_message('注册失败', '验证码错误,请重新填写', $jumpurl);	
          exit();
		}
		if ( req::item('password', '')!= '' && req::item('password', '') != req::item('password2', '') ) {
			cls_access::show_message('注册失败', '两次输入的密码不一致，请重新输入', $jumpurl);
				exit();
		}
		
        $accctl = cls_access::get_instance();
        $rs = 0;
        $errmsg = '';
       
         if (req::item('username', '') != '' && req::item('password', '') != '' &&  req::item('password2', '')!= '' && req::item('email', '')!= '' && req::item('nickname', '')!= '' ) {
            try {
				$sql1 = "SELECT * FROM `users` WHERE user_name ='".req::item('username', '')."'";
				$rsid = db::fetch_one(db::query($sql1));
				if($rsid['uid']>=1){
					cls_access::show_message('注册失败', '该账号已注册，请重新输入', $jumpurl);
					exit();
				}
				$info=array('user_name'=>req::item('username', ''),'nickname'=>req::item('nickname', ''),'userpwd'=>md5(req::item('password', '')),'email'=>req::item('email', ''),'pools'=>'admin','groups'=>'admin_test','regtime'=>time(),'dl_tcbl'=>'50');
				$insertid=db::insert('users',$info);
				$jumpurl = empty($gourl) ? '?ct=index&ac=login' : $gourl;
				cls_access::show_message('成功注册', '成功注册，正在跳转登录页面', $jumpurl);
				exit();
                
            } catch (Exception $e) {
                $errmsg = 'Error：' . $e->getMessage();
            } 
        }else{
			cls_access::show_message('注册失败', '填写信息不完整请重新输入', $jumpurl);
			exit();
		}
        tpl::assign('gourl', $gourl);
        tpl::assign('errmsg', $errmsg);
        tpl::display('login.tpl');
        exit();
    }
    

    /**
     * 系统消息
     */
    public function adminmsg() {
        $addjob = req::item('addjob', '');
        if ($addjob == 'del') {
            db::query("Update `users_admin_log` set `isread`=1  where `isalert`=1 ");
            exit('ok');
        } else {
            $row = db::get_one("Select count(*) as dd From `users_admin_log` where `isalert`=1 And `isread`=0 ");
            if (is_array($row) && $row['dd'] > 0) {
                exit($row['dd']);
            } else {
                exit('false');
            }
        }
    }

    /**
     * 退出
     */
    public function loginout() {
        $accctl = cls_access::get_instance();
        $accctl->loginout();
        cls_access::show_message('注销登录', '成功退出登录！', '/acs');
        exit();
    }

}
