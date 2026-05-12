<?php
defined('SYS_PAYPAL') or exit('error');

class Paypal
{
    protected $api;
    protected $returnUrl; // 支付成功后的回调地址
    protected $cancelUrl; // 支付取消后的回调地址
    protected $out_trade_no; //订单号
    protected $subject;      //订单名称，必填
    protected $total_amount; //付款金额，必填

    public function __construct($out_trade_no, $subject, $total_amount, $ac)
    {
        // 支付
        // 正式：https://api-m.paypal.com
        // 测试：https://api-m.sandbox.paypal.com
        $this->api = "https://api-m.paypal.com";
        $this->out_trade_no = $out_trade_no;
        $this->subject = $subject;
        $this->total_amount = $total_amount;
        //$this->returnUrl = "http://" . SMURL . "/?ct=pay&ac=notify_paypal&oid=". $out_trade_no;
        $this->returnUrl = "https://" . SMURL . "/payment/paypal/paypal.php?ac=notify&oid=". $out_trade_no;
        $this->cancelUrl = "https://" . SMURL . "/?ct=pay&ac=cancel_paypal&oid=". $out_trade_no."&cid=".$ac;
    }

    /**
     * 创建订单
     */
    public function create()
    {
        $url = $this->api . "/v2/checkout/orders";
        $data = array(
            'intent' => 'CAPTURE',
            'purchase_units' => [
                [
                    'reference_id' => $this->out_trade_no,
                    'description' => $this->subject,
                    'amount' => [
                        'currency_code' => 'USD',
                        'value' => $this->total_amount
                    ]
                ]
            ],
            'application_context' => [
                'shipping_preference' => 'NO_SHIPPING',
                'return_url' => $this->returnUrl,
                'cancel_url' => $this->cancelUrl,
            ]
        );
        // 调用上面封装的curl
        $result = $this->curl($url, $data, 'POST');
        if ($result['httpCode'] == 201) {
            $links = $result['data']['links'][1]['href'];
            $trade_id = $result['data']['id'];
            mod_order::up_order(array('trade_status' => $trade_id), 'oid=' . $this->out_trade_no);
            header("Location: {$links}");
            exit(0);
        }
    }

    /**
     * 获取订单付款
     **/
    public function success($order_id)
    {
        $order = mod_order::get_order($order_id);
        if (!$order) {
            return '订单错误';
        }
        $ac = mod_order::typetochannel($order['type']);
        $trade_order_id = $order['trade_status'];
        $url = $this->api . "/v2/checkout/orders/{$trade_order_id}/capture";
        $result = $this->curl($url, [], 'POST');
        if ($result['httpCode'] == 201) {
            if($result['data']['status'] =='COMPLETED'){
                mod_order::up_order(array('status'=>1), 'oid=' . $order_id);
                header("Location: https://".SMURL."/?ac=".$ac."&oid=".$order_id."&token=".base64_encode(md5($order_id)));
                exit;
            }
        }
        $cancelUrl = "https://" . SMURL . "/?ct=pay&ac=cancel_paypal&oid=". $order_id."&cid=".$ac;
        header("Location: ".$cancelUrl);
    }

    /**
     * 获取token，一般返回来的access token有效时是9个小时
     **/
    protected function getToken()
    {
        try {
            // 获取缓存中是否有存在
            $tokens = Cache::get('paypal', 'tokens');
            if ($tokens != null) {
                // 有存在直接返回 access_token
                $array = json_decode($tokens, true);
                return $this->resultArray(1, 'SUCCESS', [
                    'access_token' => $array['access_token']
                ]);
            }
            // 使用测试pay
            $clientId = trim(paypal_clientId);
            $clientSecret = trim(paypal_clientSecret);
            // 对凭证base64编码
            $credentials = base64_encode($clientId . ':' . $clientSecret);
            $url =  $this->api . '/v1/oauth2/token';
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, 'grant_type=client_credentials');
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/x-www-form-urlencoded',
                'Authorization: Basic ' . $credentials
            ));
            $result = curl_exec($ch);
            if (curl_errno($ch)) {
                return $this->resultArray(0, curl_error($ch));
            }
            curl_close($ch);
            // 获取成功写入缓存
            $array = json_decode($result, true);
            $flag = Cache::set('paypal', 'tokens', $result, $array['expires_in']);
            if ($flag) {
                return
                    $this->resultArray(1, 'SUCCESS', [
                        'access_token' => $array['access_token']
                    ]);
            }
        } catch (\Exception $e) {
            $this->resultArray(0, curl_error($ch));
        }
        return  $this->resultArray(0, '获取token失败');
    }

    /**
     * curl 请求 todo ①注释是access-token方式 ②是base64加密凭证
     * @param string $url
     * @param array $data
     * @param string $method
     * @return array
     */
    protected function curl($url,  $data = [],  $method = 'GET')
    {
        try {
            $payload = empty($data) ? '' : json_encode($data);
            //*  todo ① Access-Token方式，我的是放缓存，需要从缓存获取，缓存没有话会重新去请求拉取
            $tokens = $this->getToken();
            if ($tokens['code'] != 1) {
                return $this->resultArray(0, $tokens['msg']);
            }
            $token = $tokens['data']['access_token'];
            // todo ② 凭证编码
            //$token = base64_encode(trim(paypal_clientId) . ':' . trim(paypal_clientSecret));
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            // 将凭证放入请求头
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                //* todo ①  Access-Token方式请求头
                'Authorization: Bearer ' . $token
                // todo ② 直接使用base64加密凭证
                //'Authorization: Basic ' . $token
            ));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            if ($method === 'POST') {
                curl_setopt($ch, CURLOPT_POST, true);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
            } elseif ($method === 'GET') {
                curl_setopt($ch, CURLOPT_HTTPGET, true);
            }
            $result = curl_exec($ch);
            if (curl_errno($ch)) {
                return $this->resultArray(0, curl_error($ch));
            }
            $data = json_decode($result, true);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            return [
                'httpCode' => $httpCode,
                'data' => $data
            ];
        } catch (\Exception $e) {
            return $this->resultArray(0, $e->getMessage());
        }
    }

    protected function resultArray($code = 0, $msg = '', $data = null)
    {
        return [
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
        ];
        exit;
    }
}
