<?php
if (!defined('CORE')) {
	exit('Request Error!');
}

// 🔴 调试：记录错误
ini_set('display_errors', 1);
error_reporting(E_ALL);

/**
 * 首页控制器
 *
 * @version 2013.07.05
 */
class ctl_pay {

	public static $userinfo;
	public static $control;
	public $site_url;
	public $cache_enable = true; //缓存开关,调试时可设为false
	public $cachetime = 7200; //缓存时间,秒(注意:内容页缓存是单独的在video_view中设置)
	public $cache_prefix = 'www.bygoukai.com';
	public $cache_key = 'h5_index/index';
	public $str_where_ext = '`status`!=9';
	public function __construct() {
		if (empty($this->items)) {
			$this->items = new items();
		}
		$site_urls = db::get_one("SELECT * FROM `system` WHERE `name` = 'smurl'");
		if(!empty($site_urls)){
			$hosts=$site_urls['config'];
		}else{
			$hosts= $_SERVER['HTTP_HOST'];	
		}
		$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
        $this->site_url=$http_type . $hosts;
	}
	public function go() {
		$oid = req::item('oid');
		$type = req::item('type');
		
		// 获取系统支付配置
		$sys_pay_type = db::queryone("SELECT * FROM `system` WHERE `name` = 'pay_type'");
		$pay_types = explode(',', $sys_pay_type['config']);
		
		// 🔴 统一支付路由：如果开启了易支付（4），type=1(微信)和type=2(支付宝)都走易支付
		if (in_array('4', $pay_types) && ($type == 1 || $type == 2)) {
			$row = mod_order::get_order($oid);
			if (!$row || !isset($row['oid'])) {
				echo "<script>alert('订单不存在或已支付');history.back();</script>";
				exit;
			}
			$epay_type = ($type == 2) ? 'alipay' : 'wxpay';
			$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_fee'=>$row['money'],'type'=>$epay_type);
			$gourl = $this->site_url.'/SDK/epayapi.php?'.http_build_query($orders);
			mod_order::up_order(array('paytype'=>($type==2?2:1),'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");
			// 输出完整HTML跳转页
			echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>支付跳转中...</title>';
			echo '<style>*{margin:0;padding:0}body{background:linear-gradient(135deg,#667eea,#764ba2);min-height:100vh;display:flex;align-items:center;justify-content:center;font-family:sans-serif}';
			echo '.pay-box{background:#fff;border-radius:12px;padding:50px 60px;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,.2)}';
			echo '.pay-box .icon{width:48px;height:48px;border:3px solid #667eea;border-radius:50%;margin:0 auto 16px;animation:spin 1s linear infinite}';
			echo '@keyframes spin{0%{transform:rotate(0deg)}to{transform:rotate(360deg)}}';
			echo '.pay-box h2{font-size:18px;color:#333;font-weight:600;margin-bottom:8px}';
			echo '.pay-box p{font-size:14px;color:#999}</style>';
			echo '<body><div class="pay-box"><div class="icon"></div><h2>正在跳转至支付平台...</h2><p>请稍候，如未自动跳转请<a href="'.$gourl.'" style="color:#1E9FFF">点击此处</a></p></div>';
			echo '<script>window.location.href="'.$gourl.'";</script></body></html>';
			exit;
		}
		
		// 如果不是易支付模式，走官方支付
		// 如果是Stripe支付
		if($type == 6) {
			return $this->stripe_go();
		}
		
        if($type==2){//支付宝官方支付
			$row = mod_order::get_order($oid);
			$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_amount'=>$row['money'],'WIDbody'=>$row['des']);
          if(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera |Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){
					 $gourl = $this->site_url.'/payment/alipay_wap/wappay/pay.php?'.http_build_query($orders);
				}else{
					 $gourl = $this->site_url.'/payment/alipay_pc/wappay/pay.php?'.http_build_query($orders);
				}
            mod_order::up_order(array('paytype'=>2,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");
        }else{
            // 修复：先记录支付方式，再跳转，避免 die/exit 导致记录丢失
            mod_order::up_order(array('paytype'=>1,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");
            
            if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {//微信内
					header('Location: '.$this->site_url.'/getcode.php?auk=demo3&oid='.$oid);
					exit;
                }else{
					
				if(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera |Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){
					$row = mod_order::get_order($oid);
					$ac=mod_order::typetochannel($row['type']);
					$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_amount'=>$row['money'],'WIDbody'=>$row['des'],'ac'=>$ac);
					self::h5pay($orders);
				}else{
					$row = mod_order::get_order($oid);
					$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_amount'=>$row['money'],'WIDbody'=>$row['des']);
					$httpdata = http_build_query($orders);
					header('Location: '.$this->site_url.'/payment/Wxpay_gz/example/native.php?'.$httpdata);
					die;
				}
                                                                            
            }
            
		}
		echo "<script language=\"javascript\">";
		echo "document.location=\"" . $gourl . "\"";
		echo "</script>";
		exit;
	}
	#header("Location:?ct=h5_suanming&ac=sm_form&base=365&oid=$oid");
public function pay_go() {
		$oid = req::item('oid');
		$type = req::item('type');
		
		$row = mod_order::get_order($oid);
		if (!$row || !isset($row['oid'])) {
			echo "<script>alert('订单不存在或已支付');history.back();</script>";
			exit;
		}
		
		// 统一走易支付（3方支付）
		if($type=="alipay"){
			$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_fee'=>$row['money'],'type'=>'alipay');
			$gourl = $this->site_url.'/SDK/epayapi.php?'.http_build_query($orders);
            mod_order::up_order(array('paytype'=>2,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");
        }else{
            $orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_fee'=>$row['money'],'type'=>'wxpay');
			$gourl = $this->site_url.'/SDK/epayapi.php?'.http_build_query($orders);
            mod_order::up_order(array('paytype'=>1,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");
		}
		
		// 修复：输出完整 HTML 页面做跳转，避免 header() 因前置输出失败
		echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>支付跳转中...</title>';
		echo '<style>*{margin:0;padding:0}body{background:linear-gradient(135deg,#667eea,#764ba2);min-height:100vh;display:flex;align-items:center;justify-content:center;font-family:sans-serif}';
		echo '.pay-box{background:#fff;border-radius:12px;padding:50px 60px;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,.2)}';
		echo '.pay-box .icon{width:48px;height:48px;border:3px solid#667eea;border-radius:50%;margin:0 auto 16px;animation:spin 1s linear infinite}';
		echo '@keyframes spin{0%{transform:rotate(0deg)}to{transform:rotate(360deg)}}';
		echo '.pay-box h2{font-size:18px;color:#333;font-weight:600;margin-bottom:8px}';
		echo '.pay-box p{font-size:14px;color:#999}</style>';
		echo '<body><div class="pay-box"><div class="icon"></div><h2>正在跳转至支付平台...</h2><p>请稍候，如未自动跳转请<a href="'.$gourl.'" style="color:#1E9FFF">点击此处</a></p></div>';
		echo '<script>window.location.href="'.$gourl.'";</script></body></html>';
		exit;
	}

    public function paypal_go() {
		$oid = req::item('oid');
			$row = mod_order::get_order($oid);
    		$ac=mod_order::typetochannel($row['type']);
			$orders = array('WIDout_trade_no'=>$row['oid'],'WIDsubject'=>$row['des'],'WIDtotal_fee'=>$row['money'],'ac'=>$ac);
			$gourl = $this->site_url.'/payment/paypal/paypal.php?'.http_build_query($orders);
            mod_order::up_order(array('paytype'=>3,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".addslashes($oid)."'");

		echo "<script language=\"javascript\">";
		echo "document.location=\"" . $gourl . "\"";
		echo "</script>";
		exit;
	}
	/**
     * 第三方支付同步回调
     */
	public function notify() {
		$out_trade_no = req::item('out_trade_no');
		$trade_no = req::item('trade_no');

        $orders = mod_order::get_order($out_trade_no);
        if($orders){
            if ($orders['status'] == 1) {
                $ac = mod_order::typetochannel($orders['type']);
                if ($ac == 'shop_order') {
                    header("Location:".$this->site_url."/?ct=shop&ac=order_detail&order_no=".$out_trade_no);
                } else {
                    header("Location:".$this->site_url."/?ac=".$ac."&oid=".$out_trade_no."&token=".base64_encode(md5($out_trade_no)));
                }
                exit;
            } else {
                $ac = mod_order::typetochannel($orders['type']);
                if ($ac == 'shop_order') {
                    header("Location:".$this->site_url."/?ct=shop&ac=pay&order_no=".$out_trade_no);
                } else {
                    header("Location:".$this->site_url."/?ac=".$orders['type']."&oid=".$out_trade_no);
                }
                exit;
            }
        }
        header("Location:".$this->site_url);
        exit;
    }
    
    /**
     * 易支付同步通知
     */
	public function notify_yzf() {
		$out_trade_no = req::item('out_trade_no');
		$trade_no = req::item('trade_no');

        $orders = mod_order::get_order($out_trade_no);
        if(!$orders){
            header("Location:".$this->site_url);
            exit;
        }
        
        $trade_status = req::item('trade_status', '');
        if ($orders['status'] != 1 && $trade_status == 'TRADE_SUCCESS') {
            mod_order::up_order(array(
                'trade_status' => $trade_no,
                'status' => 1,
                'paytime' => date('Y-m-d G:i:s', time())
            ), "oid='" . addslashes($out_trade_no) . "'");
            
            if ($orders['type'] == 99) {
                $safe_oid = addslashes($out_trade_no);
                db::query("UPDATE shop_order SET pay_status=1, pay_time=" . time() . " WHERE order_no='{$safe_oid}' AND pay_status!=1");
            }
        }
        
		$ac=mod_order::typetochannel($orders['type']);
		
		if ($ac == 'shop_order') {
		    header("Location:" . $this->site_url . "/?ct=shop&ac=order_detail&order_no=" . $out_trade_no);
		    exit;
		}
		
		header("Location:".$this->site_url."/?ac=".$ac."&oid=".$out_trade_no."&token=".base64_encode(md5($out_trade_no)));
		exit;
    }
    
    // 取消订单
	public function cancel_paypal() {
	    $oid = req::item('oid');
	    $ac = req::item('cid');
	    header("Location:".$this->site_url."/?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)));
		exit;
    }

    // PayPal 支付回调
	public function notify_paypal() {
	    $out_trade_no = req::item('oid');
	    $token = req::item('token');
	    $PayerID = req::item('PayerID');
	    
	    $orders = mod_order::get_order($out_trade_no);
	    if(!$orders){
	        header("Location:".$this->site_url);
	        exit;
	    }
	    
	    $ac = mod_order::typetochannel($orders['type']);
	    
        if($token && $PayerID){     
            require_once dirname($_SERVER['DOCUMENT_ROOT']).'/ffsm/payment/paypal/paypal_class.php';
            
            $paypal_config = array(
                'business' => $GLOBALS['config']['money']['paypal_business'] ? $GLOBALS['config']['money']['paypal_business'] : '',
            );
            
            $p = new paypal_class($paypal_config);
            
            if ($orders['status'] != 1) {
                mod_order::up_order(array(
                    'status'=>1,
                    'paytype'=>3,
                    'paytime'=>date('Y-m-d G:i:s', time())
                ), " `oid`='" . addslashes($out_trade_no) . "'");
            }
            
            header("Location:".$this->site_url."/?ac=".$ac."&oid=".$out_trade_no."&token=".base64_encode(md5($out_trade_no)));
        } else {
            header("Location:".$this->site_url."/?ac=".$ac."&oid=".$out_trade_no);
        }
		exit;
    }
    
    
	public function scanquery(){
		$oid = req::item('oid');
		$row = mod_order::get_order($oid);
		
		$return = array('status' => false, 'url' => '');
		
		if ($row && isset($row['status']) && $row['status'] == '1') {
			$return['status'] = true;
			$ac = mod_order::typetochannel($row['type']);
			if ($ac == 'shop_order') {
				$return['url'] = "/?ct=shop&ac=order_detail&order_no=" . $oid;
			} else {
				$return['url'] = $this->site_url . "/?ac=" . $ac . "&oid=" . $oid . "&token=" . base64_encode(md5($oid));
			}
		}
		
		header('Content-Type: application/json; charset=utf-8');
		exit(json_encode($return));
	}

    
    public function h5pay($row){
        $orders = $row;
      $httpdata = http_build_query($orders);
	  

   	  header('Location: '.$this->site_url.'/payment/Wxpay_gz/example/h5api.php?'.$httpdata);
	  die; 
      send($this->site_url.'/payment/Wxpay_gz/example/h5api.php',$orders);
      die;

    }


    /**
     * H5支付异步回调
     */
    public function h5paycallback(){
        $xml = isset($GLOBALS['HTTP_RAW_POST_DATA']) ? $GLOBALS['HTTP_RAW_POST_DATA'] : file_get_contents("php://input");
        
        file_put_contents('callbackxml3.txt',$xml);
        
        $result = WxPayResults::Init($xml);
        file_put_contents('callback3.txt',json_encode($result));
        
        if($result && isset($result['return_code']) && $result['return_code'] == 'SUCCESS' 
           && isset($result['result_code']) && $result['result_code'] == 'SUCCESS'
           && isset($result['out_trade_no'])) {
            
            $oid = $result['out_trade_no'];
            $transaction_id = isset($result['transaction_id']) ? $result['transaction_id'] : '';
            
            $order = mod_order::get_order($oid);
            if ($order && $order['status'] != 1) {
                $wechat_amount = intval($result['total_fee']);
                $order_amount = intval(floatval($order['money']) * 100);
                
                if ($wechat_amount >= $order_amount) {
                    mod_order::up_order(array(
                        'status' => 1,
                        'paytype' => 1,
                        'paytime' => date('Y-m-d G:i:s', time()),
                        'trade_status' => $transaction_id
                    ), " `oid`='" . addslashes($oid) . "'");
                    
                    file_put_contents('h5pay_success.txt', date('Y-m-d H:i:s')." 订单{$oid} H5支付成功\n", FILE_APPEND);
                } else {
                    file_put_contents('h5pay_error.txt', date('Y-m-d H:i:s')." 订单{$oid} 金额不匹配: 订单={$order_amount}, 微信={$wechat_amount}\n", FILE_APPEND);
                }
            }
        }
        
        echo '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
        die;
    }




    public function wxjsapi(){
		
        $code = req::item('code');
        $oid = req::item('oid');
		$openid = req::item('openid');
        if(!empty($code)){
		
          
            $appid = $GLOBALS['config']['money']['wx_appid'];
            $secret = $GLOBALS['config']['money']['wx_appsecret'];
            $weixin =  file_get_contents("https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$secret."&code=".$code."&grant_type=authorization_code");//通过code换取网页授权access_token
            $jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
            $array = get_object_vars($jsondecode);//转换成数组
            $openid = $array['openid'];//输出openid
        }

        if(!$openid){
            die('openid is null');
        }
		
		$row = mod_order::get_order($oid);
		
		$ac=mod_order::typetochannel($row['type']);
		$row['url'] = $this->site_url."/?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid));
		$row['oid'] = $oid;
        $sub_openid = $openid;
		
		$data['openid'] = $openid;
		$data['oid'] = $oid;
		$data['des'] = $row['des'];
		$data['money'] = $row['money'];

        $return = send($this->site_url.'/payment/Wxpay_gz/example/jsapi.php',$data);
		
		$return = json_decode($return,true);
		
		
		if($return){
			$rows["appId"]= $return["appId"];
			$rows["timeStamp"]= $return["timeStamp"];
			$rows["nonceStr"]= $return["nonceStr"];
			$rows["package"]= $return["package"];
			$rows["signType"]= $return["signType"];
			$rows["paySign"]= $return["paySign"];
		}
		tpl::assign('row',$row);
        tpl::assign('pay_info',$rows);

        $tpl     = 'ffsm/wx_gzh_pay.tpl';

        $contents = tpl::fetch($tpl);

        exit($contents);

    }

    public function stripe_go() {
        $oid = req::item('oid');
        if(empty($oid)) {
            die('订单号不能为空');
        }
        
        require_once dirname($_SERVER['DOCUMENT_ROOT']).'/ffsm/payment/stripe/vendor/autoload.php';
        require_once dirname($_SERVER['DOCUMENT_ROOT']).'/ffsm/payment/stripe/config.php';
        
        $row = mod_order::get_order($oid);
        if(empty($row)) {
            die('订单不存在');
        }
        
        $ac = mod_order::typetochannel($row['type']);
        
        try {
            \Stripe\Stripe::setApiKey($stripe_config['secret_key']);
            
            $session = \Stripe\Checkout\Session::create([
                'payment_method_types' => ['card'],
                'line_items' => [[
                    'price_data' => [
                        'currency' => $stripe_config['currency'],
                        'unit_amount' => intval($row['money'] * 100),
                        'product_data' => [
                            'name' => $row['des'],
                        ],
                    ],
                    'quantity' => 1,
                ]],
                'mode' => 'payment',
                'success_url' => $this->site_url.'/?ct=pay&ac=notify_stripe&oid='.$oid.'&token='.base64_encode(md5($oid)),
                'cancel_url' => $stripe_config['cancel_url'].'?oid='.$oid.'&cid='.$ac,
                'metadata' => [
                    'order_id' => $oid
                ],
            ]);
            
            mod_order::up_order(array('paytype'=>6,'paytime'=>date('Y-m-d G:i:s',time()))," `oid`='".$oid."'");
            
            header("Location: " . $session->url);
            exit();
            
        } catch(Exception $e) {
            die('支付发起失败:'.$e->getMessage());
        }
    }

    // Stripe支付回调
    public function notify_stripe() {
        $oid = req::item('oid');
        $token = req::item('token');
        
        if($token != base64_encode(md5($oid))) {
            die('验证失败');
        }
        
        $orders = mod_order::get_order($oid);
        if(!$orders) {
            die('订单不存在');
        }

        $ac = mod_order::typetochannel($orders['type']);
        
        if($orders['status'] != 1) {
            $update_data = array(
                'status' => 1,
                'paytime' => date('Y-m-d G:i:s', time())
            );
            mod_order::up_order($update_data, " `oid`='".$oid."'");
        }

        header("Location:".$this->site_url."/?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)));
        exit;
    }

    // Stripe支付取消
    public function cancel_stripe() {
        $oid = req::item('oid');
        $ac = req::item('cid');
        header("Location:".$this->site_url."/?ac=".$ac."&oid=".$oid."&token=".base64_encode(md5($oid)));
        exit;
    }

}