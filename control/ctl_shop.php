<?php
if( !defined('CORE') ) exit('Request Error!');
/**
 * 商城控制器
 */
class ctl_shop {
    
    private $shop_model;
    private $uid;
    
    public function __construct() {
        require_once PATH_ROOT . '/model/mod_shop.php';
        $this->shop_model = new mod_shop();
        
        // 获取登录用户ID（使用系统的登录方式）
        if (!empty($_COOKIE['user_name'])) {
            $query = "SELECT * FROM `users` WHERE `user_name`='" . addslashes($_COOKIE['user_name']) . "'";
            $user = db::get_one($query);
            $this->uid = $user ? intval($user['uid']) : 0;
        } else {
            $this->uid = 0;
        }
        
        // 设置公共变量
        tpl::assign('web_url', URL);
        tpl::assign('uid', $this->uid);
        
        // 获取一级栏目
        $pid = mod_topic::get_p_id();
        tpl::assign('pid', $pid);
    }
    
    /**
     * 错误提示
     */
    private function error($msg) {
        echo '<script>alert("' . $msg . '");history.back();</script>';
        exit;
    }
    
    /**
     * 跳转
     */
    private function redirect($url) {
        header('Location: ' . $url);
        exit;
    }
    
    /**
     * AJAX返回
     */
    private function ajaxReturn($data) {
        header('Content-Type: application/json');
        echo json_encode($data);
        exit;
    }
    
    /**
     * 商城首页
     */
    public function index() {
        // 获取分类
        $category_tree = $this->shop_model->getCategoryTree();
        
        // 获取所有上架商品
        $goods_list = $this->shop_model->getGoodsList(array('pagesize' => 100));
        
        // 处理图片路径，去掉/ffsm/前缀
        if (!empty($goods_list['list'])) {
            foreach ($goods_list['list'] as $key => $goods) {
                if (!empty($goods['thumb'])) {
                    $goods_list['list'][$key]['thumb'] = str_replace('/ffsm/', '/', $goods['thumb']);
                }
            }
        }
        
        tpl::assign('zhanming', '商城');
        tpl::assign('category_tree', $category_tree);
        tpl::assign('goods_list', $goods_list['list']);
        
        $tpl = 'ffsm/shop_index.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 商品列表
     */
    public function goods_list() {
        $cid = req::item('cid', 0);
        $keyword = req::item('keyword', '');
        $order = req::item('order', '');
        $page = req::item('page', 1);
        
        $params = array(
            'page' => $page,
            'pagesize' => 20
        );
        
        if ($cid > 0) {
            $params['cid'] = $cid;
        }
        
        if ($keyword) {
            $params['keyword'] = $keyword;
        }
        
        if ($order) {
            $params['order'] = $order;
        }
        
        $result = $this->shop_model->getGoodsList($params);
        
        // 处理图片路径，去掉/ffsm/前缀
        if (!empty($result['list'])) {
            foreach ($result['list'] as $key => $goods) {
                if (!empty($goods['thumb'])) {
                    $result['list'][$key]['thumb'] = str_replace('/ffsm/', '/', $goods['thumb']);
                }
            }
        }
        
        // 获取分类信息
        $category_tree = $this->shop_model->getCategoryTree();
        
        tpl::assign('zhanming', '商城');
        tpl::assign('goods_list', $result['list']);
        tpl::assign('total', $result['total']);
        tpl::assign('page', $result['page']);
        tpl::assign('pagesize', $result['pagesize']);
        tpl::assign('cid', $cid);
        tpl::assign('keyword', $keyword);
        tpl::assign('order', $order);
        tpl::assign('category_tree', $category_tree);
        
        $tpl = 'ffsm/shop_goods_list.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 商品详情
     */
    public function goods_detail() {
        $id = req::item('id', 0);
        
        if ($id <= 0) {
            $this->error('商品不存在');
        }
        
        $goods = $this->shop_model->getGoodsDetail($id);
        
        if (!$goods) {
            $this->error('商品不存在或已下架');
        }
        
        // 处理图片路径，去掉/ffsm/前缀
        if (!empty($goods['thumb'])) {
            $goods['thumb'] = str_replace('/ffsm/', '/', $goods['thumb']);
        }
        if (!empty($goods['images'])) {
            $goods['images'] = str_replace('/ffsm/', '/', $goods['images']);
        }
        if (!empty($goods['goods_desc'])) {
            $goods['goods_desc'] = str_replace('/ffsm/', '/', $goods['goods_desc']);
        }
        
        // 添加浏览历史（暂时注释，避免报错）
        // if ($this->uid > 0) {
        //     $this->shop_model->addHistory($this->uid, $id);
        // }
        
        // 检查是否已收藏
        $is_favorite = 0;
        if ($this->uid > 0) {
            $uid = intval($this->uid);
            $fav_sql = "SELECT id FROM shop_favorite WHERE uid={$uid} AND goods_id={$id}";
            $fav = db::get_one($fav_sql);
            $is_favorite = $fav ? 1 : 0;
        }
        
        tpl::assign('zhanming', '商城');
        tpl::assign('goods', $goods);
        tpl::assign('is_favorite', $is_favorite);
        
        $tpl = 'ffsm/shop_goods_detail.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 加入购物车
     */
    public function add_cart() {
        // 移除登录限制，允许游客购买
        
        $goods_id = isset($_POST['goods_id']) ? intval($_POST['goods_id']) : 0;
        $spec_id = isset($_POST['spec_id']) ? intval($_POST['spec_id']) : 0;
        $num = isset($_POST['num']) ? intval($_POST['num']) : 1;
        
        if ($goods_id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '参数错误'));
        }
        
        if ($num <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '数量必须大于0'));
        }
        
        // 检查商品是否存在
        $goods = $this->shop_model->getGoodsDetail($goods_id);
        if (!$goods) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '商品不存在或已下架'));
        }
        
        // 检查库存
        if ($goods['stock'] < $num) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '库存不足'));
        }
        
        $result = $this->shop_model->addToCart($this->uid, $goods_id, $spec_id, $num);
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '加入购物车成功'));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '加入购物车失败'));
        }
    }
    
    /**
     * 购物车页面
     */
    public function cart() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $cart_list = $this->shop_model->getCartList($this->uid);
        
        // 计算总价
        $total_price = 0;
        foreach ($cart_list as $item) {
            if ($item['goods_status'] == 1) {
                $total_price += $item['price'] * $item['num'];
            }
        }
        
        tpl::assign('cart_list', $cart_list);
        tpl::assign('total_price', $total_price);
        
        $content = tpl::fetch('shop_cart.tpl');
        exit($content);
    }
    
    /**
     * 更新购物车
     */
    public function update_cart() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $cart_id = isset($_POST['cart_id']) ? intval($_POST['cart_id']) : 0;
        $num = isset($_POST['num']) ? intval($_POST['num']) : 1;
        
        if ($cart_id <= 0 || $num < 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '参数错误'));
        }
        
        $result = $this->shop_model->updateCartNum($cart_id, $num);
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '更新成功'));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '更新失败'));
        }
    }
    
    /**
     * 删除购物车
     */
    public function delete_cart() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $cart_id = isset($_POST['cart_id']) ? intval($_POST['cart_id']) : 0;
        
        if ($cart_id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '参数错误'));
        }
        
        $result = $this->shop_model->deleteCart($cart_id);
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '删除成功'));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '删除失败'));
        }
    }
    
    /**
     * 立即购买（游客也可购买）
     */
    public function buy_now() {
        $goods_id = req::item('goods_id', 0);
        $num = req::item('num', 1);
        $spec_id = req::item('spec_id', 0);
        
        if ($goods_id <= 0) {
            $this->error('商品不存在');
        }
        
        // 获取商品信息
        $goods = $this->shop_model->getGoodsDetail($goods_id);
        if (!$goods) {
            $this->error('商品不存在或已下架');
        }
        
        // 检查库存
        if ($goods['stock'] < $num) {
            $this->error('库存不足');
        }
        
        // 计算总价
        $total_price = $goods['price'] * $num;
        
        tpl::assign('goods', $goods);
        tpl::assign('num', $num);
        tpl::assign('spec_id', $spec_id);
        tpl::assign('total_price', $total_price);
        
        $tpl = 'ffsm/shop_buy_now.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 确认订单页面
     */
    public function checkout() {
        // 移除登录限制，允许游客下单
        
        $cart_ids = isset($_POST['cart_ids']) ? $_POST['cart_ids'] : array();
        
        if (empty($cart_ids)) {
            $this->error('请选择要购买的商品');
        }
        
        // 获取购物车商品
        $cart_list = $this->shop_model->getCartList($this->uid);
        $selected_goods = array();
        $total_price = 0;
        
        foreach ($cart_list as $item) {
            if (in_array($item['id'], $cart_ids)) {
                $selected_goods[] = $item;
                $total_price += $item['price'] * $item['num'];
            }
        }
        
        // 获取收货地址
        $address_list = $this->shop_model->getAddressList($this->uid);
        
        tpl::assign('cart_ids', $cart_ids);
        tpl::assign('goods_list', $selected_goods);
        tpl::assign('total_price', $total_price);
        tpl::assign('address_list', $address_list);
        
        $content = tpl::fetch('shop_checkout.tpl');
        exit($content);
    }
    
    /**
     * 提交立即购买订单
     */
    public function submit_buy_now() {
        $goods_id = req::item('goods_id', 0);
        $num = req::item('num', 1);
        $spec_id = req::item('spec_id', 0);
        $name = req::item('name', '');
        $mobile = req::item('mobile', '');
        $address = req::item('address', '');
        $remark = req::item('remark', '');
        
        if ($goods_id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '商品不存在'));
        }
        
        if (empty($name)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请输入收货人姓名'));
        }
        
        if (empty($mobile)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请输入手机号码'));
        }
        
        if (empty($address)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请输入收货地址'));
        }
        
        // 获取商品信息
        $goods = $this->shop_model->getGoodsDetail($goods_id);
        if (!$goods) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '商品不存在或已下架'));
        }
        
        // 检查库存
        if ($goods['stock'] < $num) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '库存不足'));
        }
        
        // 计算总价
        $total_price = $goods['price'] * $num;
        
        // 生成订单号 (使用系统统一的订单号生成方法)
        $order_no = mod_order::createoid(99); // 99代表商城订单
        $time = time();
        
        // 1. 插入到系统订单表 ffsm_orders (用于支付)
        $order_desc = $goods['goods_name'] . ' x' . $num;
        $order_data = array(
            'oid' => $order_no,
            'type' => 99,
            'uid' => $this->uid ? $this->uid : 0,
            'username' => $name,
            'money' => $total_price,
            'des' => $order_desc,
            'status' => 0,
            'createtime' => date('Y-m-d H:i:s', $time),
            'ip' => util::get_client_ip()
        );
        
        $order_result = db::insert('ffsm_orders', $order_data);
        
        if (!$order_result) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单创建失败'));
        }
        
        // 2. 插入商城订单表 shop_order
        $shop_order_sql = "INSERT INTO shop_order SET 
            order_no='{$order_no}',
            uid=" . ($this->uid ? $this->uid : 0) . ",
            total_price={$total_price},
            pay_price={$total_price},
            pay_status=0,
            ship_status=0,
            ship_name='" . addslashes($name) . "',
            ship_mobile='" . addslashes($mobile) . "',
            ship_address='" . addslashes($address) . "',
            remark='" . addslashes($remark) . "',
            status=1,
            create_time={$time}";
        
        db::query($shop_order_sql);
        $order_id = db::insert_id();
        
        // 3. 插入订单商品表
        $goods_sql = "INSERT INTO shop_order_goods SET 
            order_id={$order_id},
            order_no='{$order_no}',
            goods_id={$goods_id},
            goods_name='" . addslashes($goods['goods_name']) . "',
            goods_thumb='" . addslashes($goods['thumb']) . "',
            spec_id={$spec_id},
            price={$goods['price']},
            num={$num},
            total_price={$total_price}";
        
        db::query($goods_sql);
        
        // 暂不减库存，支付成功后再减
        
        // 添加到订单历史记录
        mod_order::set_history($order_no);
        
        $this->ajaxReturn(array('code' => 1, 'msg' => '订单提交成功', 'order_no' => $order_no));

    }
    
    /**
     * 支付页面
     */
    public function pay() {
        $order_no = req::item('order_no', '');
        
        if (empty($order_no)) {
            $this->error('订单不存在');
        }
        
        // 获取订单信息
        $order_sql = "SELECT * FROM shop_order WHERE order_no='{$order_no}'";
        $order = db::get_one($order_sql);
        
        if (!$order) {
            $this->error('订单不存在');
        }
        
        // 获取订单商品
        $goods_sql = "SELECT * FROM shop_order_goods WHERE order_no='{$order_no}'";
        $goods_list = db::get_all($goods_sql);
        
        tpl::assign('order', $order);
        tpl::assign('goods_list', $goods_list);
        
        $tpl = 'ffsm/shop_pay.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 确认支付 → 跳转到易支付
     * 🔴 修复：去掉直接标记已支付的逻辑，改为跳转到易支付进行真实支付
     */
    public function confirm_pay() {
        $order_no = req::item('order_no', '');
        $pay_type = req::item('pay_type', '');
        
        if (empty($order_no)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单号不能为空'));
        }
        
        if (empty($pay_type)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请选择支付方式'));
        }
        
        // 查询订单
        $order_sql = "SELECT * FROM shop_order WHERE order_no='{$order_no}'";
        $order = db::get_one($order_sql);
        
        if (!$order) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单不存在'));
        }
        
        if ($order['pay_status'] == 1) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '该订单已支付'));
        }
        
        // 查询 ffsm_orders 表获取订单数据
        $ffsm_order = mod_order::get_order($order_no);
        if (!$ffsm_order) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '支付订单不存在'));
        }
        
        // 根据支付类型跳转到对应的支付网关（通过 pay_go）
        if ($pay_type == 'alipay' || $pay_type == 'zfb') {
            $epay_type = 'alipay';
        } else {
            $epay_type = 'wxpay';
        }
        
        // 构建跳转URL到易支付
        $epay_url = '/?ct=pay&ac=pay_go&oid=' . urlencode($order_no) . '&type=' . $epay_type;
        
        $this->ajaxReturn(array(
            'code' => 1, 
            'msg' => '跳转支付中...', 
            'data' => array('url' => $epay_url)
        ));
    }
    
    /**
     * 提交订单
     */
    public function submit_order() {
        // 移除登录限制，允许游客提交订单
        
        $cart_ids = isset($_POST['cart_ids']) ? $_POST['cart_ids'] : array();
        $address_id = isset($_POST['address_id']) ? intval($_POST['address_id']) : 0;
        $remark = isset($_POST['remark']) ? trim($_POST['remark']) : '';
        
        if (empty($cart_ids)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请选择要购买的商品'));
        }
        
        if ($address_id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请选择收货地址'));
        }
        
        $result = $this->shop_model->createOrder($this->uid, $cart_ids, $address_id, $remark);
        
        if ($result['code'] == 1) {
            // 跳转到支付页面
            $this->ajaxReturn(array(
                'code' => 1, 
                'msg' => '订单创建成功', 
                'data' => array('order_no' => $result['order_no'])
            ));
        } else {
            $this->ajaxReturn($result);
        }
    }
    
    /**
     * 我的商城订单（用户中心）
     */
    public function my_orders() {
        if (!$this->uid) {
            echo '<script>alert("请先登录");location.href="/?ac=userlogin";</script>';
            exit;
        }
        
        // 获取当前用户的所有商城订单
        $sql = "SELECT * FROM shop_order WHERE uid={$this->uid} ORDER BY create_time DESC";
        $order_list = db::get_all($sql);
        
        // 格式化时间
        foreach ($order_list as &$order) {
            $order['create_time_format'] = date('Y-m-d H:i:s', $order['create_time']);
            if ($order['pay_time']) {
                $order['pay_time_format'] = date('Y-m-d H:i:s', $order['pay_time']);
            }
            // 获取订单商品
            $goods_sql = "SELECT * FROM shop_order_goods WHERE order_no='{$order['order_no']}'";
            $order['goods_list'] = db::get_all($goods_sql);
        }
        
        tpl::assign('order_list', $order_list);
        
        $tpl = 'ffsm/my_shop_orders.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 订单列表
     */
    public function order_list() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $pay_status = isset($_GET['pay_status']) ? intval($_GET['pay_status']) : -1;
        
        $params = array();
        if ($pay_status >= 0) {
            $params['pay_status'] = $pay_status;
        }
        
        $order_list = $this->shop_model->getOrderList($this->uid, $params);
        
        tpl::assign('order_list', $order_list);
        tpl::assign('pay_status', $pay_status);
        
        $content = tpl::fetch('shop_order_list.tpl');
        exit($content);
    }
    
    /**
     * 订单详情（前台用户查看）
     */
    public function order_detail() {
        $order_no = req::item('order_no', '');
        
        if (empty($order_no)) {
            echo '<script>alert("订单不存在");history.back();</script>';
            exit;
        }
        
        // 获取订单信息
        $order_sql = "SELECT * FROM shop_order WHERE order_no='{$order_no}'";
        $order = db::get_one($order_sql);
        
        if (!$order) {
            echo '<script>alert("订单不存在");history.back();</script>';
            exit;
        }
        
        // 获取订单商品
        $goods_sql = "SELECT * FROM shop_order_goods WHERE order_no='{$order_no}'";
        $goods_list = db::get_all($goods_sql);
        
        // 格式化时间
        $order['create_time_format'] = date('Y-m-d H:i:s', $order['create_time']);
        if ($order['pay_time']) {
            $order['pay_time_format'] = date('Y-m-d H:i:s', $order['pay_time']);
        }
        if ($order['ship_time']) {
            $order['ship_time_format'] = date('Y-m-d H:i:s', $order['ship_time']);
        }
        
        // 生成页面标题（第一个商品名称）
        $page_title = !empty($goods_list) ? $goods_list[0]['goods_name'] : '订单详情';
        
        tpl::assign('page_title', $page_title);
        tpl::assign('order', $order);
        tpl::assign('goods_list', $goods_list);
        
        $tpl = 'ffsm/shop_order_detail.tpl';
        $content = tpl::fetch($tpl);
        exit($content);
    }
    
    /**
     * 订单详情（后台管理）
     */
    public function admin_order_detail() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $order_no = isset($_GET['order_no']) ? trim($_GET['order_no']) : '';
        
        if (empty($order_no)) {
            $this->error('订单号不能为空');
        }
        
        $order = $this->shop_model->getOrderDetail($order_no, $this->uid);
        
        if (!$order) {
            $this->error('订单不存在');
        }
        
        tpl::assign('order', $order);
        
        $content = tpl::fetch('shop_order_detail.tpl');
        exit($content);
    }
    
    /**
     * 收藏/取消收藏
     */
    public function favorite() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $goods_id = isset($_POST['goods_id']) ? intval($_POST['goods_id']) : 0;
        $action = isset($_POST['action']) ? trim($_POST['action']) : 'add';
        
        if ($goods_id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '参数错误'));
        }
        
        if ($action == 'add') {
            $result = $this->shop_model->addFavorite($this->uid, $goods_id);
        } else {
            $result = $this->shop_model->deleteFavorite($this->uid, $goods_id);
            $result = array('code' => 1, 'msg' => '取消收藏成功');
        }
        
        $this->ajaxReturn($result);
    }
    
    /**
     * 收藏列表
     */
    public function favorite_list() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $list = $this->shop_model->getFavoriteList($this->uid);
        
        tpl::assign('favorite_list', $list);
        
        $content = tpl::fetch('shop_favorite.tpl');
        exit($content);
    }
    
    /**
     * 浏览历史
     */
    public function history() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $list = $this->shop_model->getHistoryList($this->uid);
        
        tpl::assign('history_list', $list);
        
        $content = tpl::fetch('shop_history.tpl');
        exit($content);
    }
    
    /**
     * 地址管理
     */
    public function address() {
        if (!$this->uid) {
            $this->redirect('/?ac=userlogin');
        }
        
        $list = $this->shop_model->getAddressList($this->uid);
        
        tpl::assign('address_list', $list);
        
        $content = tpl::fetch('shop_address.tpl');
        exit($content);
    }
    
    /**
     * 添加/编辑地址
     */
    public function save_address() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        $name = isset($_POST['name']) ? trim($_POST['name']) : '';
        $mobile = isset($_POST['mobile']) ? trim($_POST['mobile']) : '';
        $province = isset($_POST['province']) ? trim($_POST['province']) : '';
        $city = isset($_POST['city']) ? trim($_POST['city']) : '';
        $district = isset($_POST['district']) ? trim($_POST['district']) : '';
        $address = isset($_POST['address']) ? trim($_POST['address']) : '';
        $is_default = isset($_POST['is_default']) ? intval($_POST['is_default']) : 0;
        
        if (empty($name) || empty($mobile) || empty($address)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请填写完整信息'));
        }
        
        $data = array(
            'uid' => $this->uid,
            'name' => $name,
            'mobile' => $mobile,
            'province' => $province,
            'city' => $city,
            'district' => $district,
            'address' => $address,
            'is_default' => $is_default
        );
        
        if ($id > 0) {
            // 编辑
            $result = $this->shop_model->updateAddress($id, $this->uid, $data);
            $msg = '地址更新成功';
        } else {
            // 新增
            $result = $this->shop_model->addAddress($data);
            $msg = '地址添加成功';
        }
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => $msg));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '操作失败'));
        }
    }
    
    /**
     * 删除地址
     */
    public function delete_address() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $id = isset($_POST['id']) ? intval($_POST['id']) : 0;
        
        if ($id <= 0) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '参数错误'));
        }
        
        $result = $this->shop_model->deleteAddress($id, $this->uid);
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '删除成功'));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '删除失败'));
        }
    }
    
    /**
     * 确认收货
     */
    public function confirm_receipt() {
        if (!$this->uid) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '请先登录'));
        }
        
        $order_no = isset($_POST['order_no']) ? trim($_POST['order_no']) : '';
        
        if (empty($order_no)) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单号不能为空'));
        }
        
        // 验证订单是否属于当前用户
        $order = $this->shop_model->getOrderDetail($order_no, $this->uid);
        
        if (!$order) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单不存在'));
        }
        
        if ($order['ship_status'] != 1) {
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单状态不正确'));
        }
        
        // 更新订单状态为已收货
        $sql = "UPDATE shop_order SET ship_status=2, update_time=" . time() . " WHERE order_no='" . addslashes($order_no) . "' AND uid=" . intval($this->uid);
        $result = db::query($sql);
        
        if ($result) {
            $this->ajaxReturn(array('code' => 1, 'msg' => '确认收货成功'));
        } else {
            $this->ajaxReturn(array('code' => 0, 'msg' => '操作失败'));
        }
    }
}
