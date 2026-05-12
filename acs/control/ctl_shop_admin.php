<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 商城后台管理控制器
 */
class ctl_shop_admin
{
    public function __construct()
    {
        tpl::assign('web_title', "商城管理");
    }

    /**
     * 商品分类管理
     */
    public function category()
    {
        $action = req::item('action', '');
        
        // 处理添加/编辑/删除
        if ($action == 'save') {
            $this->save_category();
            return;
        } elseif ($action == 'delete') {
            $this->delete_category();
            return;
        } elseif ($action == 'add_form' || $action == 'edit_form') {
            $this->category_form();
            return;
        }
        
        // 获取分类列表
        $sql = "SELECT * FROM shop_category ORDER BY sort ASC, id DESC";
        $list = db::get_all($sql);
        
        tpl::assign('list', $list);
        tpl::assign('web_title', "商品分类管理");
        tpl::display('shop.category.html');
    }
    
    /**
     * 分类表单页面
     */
    private function category_form()
    {
        $id = req::item('id', 0);
        
        // 获取所有分类用于父分类选择
        $category_list = db::get_all("SELECT * FROM shop_category WHERE status=1 ORDER BY sort ASC");
        tpl::assign('category_list', $category_list);
        
        if ($id > 0) {
            // 编辑
            $category = db::get_one("SELECT * FROM shop_category WHERE id={$id}");
            tpl::assign('category', $category);
            tpl::assign('web_title', "编辑分类");
        } else {
            tpl::assign('web_title', "添加分类");
        }
        
        tpl::display('shop.category_form.html');
    }
    
    /**
     * 保存分类
     */
    private function save_category()
    {
        $id = req::item('id', 0);
        $data = array(
            'name' => req::item('name', ''),
            'pid' => req::item('pid', 0),
            'sort' => req::item('sort', 0),
            'icon' => req::item('icon', ''),
            'status' => req::item('status', 1),
        );
        
        if (empty($data['name'])) {
            cls_msgbox::show('', '分类名称不能为空', '-1');
            return;
        }
        
        if ($id > 0) {
            db::update('shop_category', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            $data['create_time'] = time();
            db::insert('shop_category', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=shop_admin&ac=category');
    }
    
    /**
     * 删除分类
     */
    private function delete_category()
    {
        $id = req::item('id', 0);
        
        if ($id <= 0) {
            cls_msgbox::show('', '参数错误', '-1');
            return;
        }
        
        // 检查是否有子分类
        $count = db::get_one("SELECT COUNT(*) as total FROM shop_category WHERE pid={$id}");
        if ($count['total'] > 0) {
            cls_msgbox::show('', '该分类下有子分类，无法删除', '-1');
            return;
        }
        
        // 检查是否有商品
        $goods_count = db::get_one("SELECT COUNT(*) as total FROM shop_goods WHERE cid={$id}");
        if ($goods_count['total'] > 0) {
            cls_msgbox::show('', '该分类下有商品，无法删除', '-1');
            return;
        }
        
        db::query("DELETE FROM shop_category WHERE id={$id}");
        cls_msgbox::show('', '删除成功！', '?ct=shop_admin&ac=category');
    }

    /**
     * 商品列表
     */
    public function goods_list()
    {
        $action = req::item('action', '');
        
        // 处理删除
        if ($action == 'delete') {
            $this->delete_goods();
            return;
        } elseif ($action == 'update_status') {
            $this->update_goods_status();
            return;
        }
        
        // 获取筛选条件
        $cid = req::item('cid', 0);
        $keyword = req::item('keyword', '');
        $status = req::item('status', '');
        $page = req::item('page', 1);
        $pagesize = 20;
        
        $where = "1=1";
        $params = array();
        
        if ($cid > 0) {
            $where .= " AND g.cid=?";
            $params[] = $cid;
        }
        
        if ($keyword) {
            $where .= " AND g.goods_name LIKE ?";
            $params[] = '%' . $keyword . '%';
        }
        
        if ($status !== '') {
            $where .= " AND g.status=?";
            $params[] = $status;
        }
        
        // 获取总数
        $count_sql = "SELECT COUNT(*) as total FROM shop_goods g WHERE {$where}";
        $total = db::get_one($count_sql, $params);
        
        // 获取列表
        $offset = ($page - 1) * $pagesize;
        $sql = "SELECT g.*, c.name as category_name 
                FROM shop_goods g 
                LEFT JOIN shop_category c ON g.cid=c.id 
                WHERE {$where}
                ORDER BY g.sort ASC, g.id DESC 
                LIMIT {$offset}, {$pagesize}";
        $list = db::get_all($sql, $params);
        
        // 获取分类列表
        $category_list = db::get_all("SELECT * FROM shop_category WHERE status=1 ORDER BY sort ASC");
        
        tpl::assign('list', $list);
        tpl::assign('category_list', $category_list);
        tpl::assign('total', $total['total']);
        tpl::assign('page', $page);
        tpl::assign('pagesize', $pagesize);
        tpl::assign('cid', $cid);
        tpl::assign('keyword', $keyword);
        tpl::assign('status', $status);
        tpl::assign('web_title', "商品列表");
        tpl::display('shop.goods_list.html');
    }
    
    /**
     * 添加/编辑商品
     */
    public function goods_add()
    {
        $action = req::item('action', '');
        
        if ($action == 'save') {
            $this->save_goods();
            return;
        }
        
        $id = req::item('id', 0);
        
        if ($id > 0) {
            // 编辑
            $goods = db::get_one("SELECT * FROM shop_goods WHERE id={$id}");
            
            // 获取规格
            $specs = db::get_all("SELECT * FROM shop_goods_spec WHERE goods_id={$id}");
            $goods['specs'] = $specs;
            
            tpl::assign('goods', $goods);
            tpl::assign('web_title', "编辑商品");
        } else {
            tpl::assign('web_title', "添加商品");
        }
        
        // 获取分类列表
        $category_list = db::get_all("SELECT * FROM shop_category WHERE status=1 ORDER BY sort ASC");
        tpl::assign('category_list', $category_list);
        
        tpl::display('shop.goods_form.html');
    }
    
    /**
     * 保存商品
     */
    private function save_goods()
    {
        $id = req::item('id', 0);
        $data = array(
            'cid' => req::item('cid', 0),
            'goods_name' => req::item('goods_name', ''),
            'goods_desc' => req::item('goods_desc', ''),
            'goods_type' => req::item('goods_type', 1),
            'thumb' => req::item('thumb', ''),
            'home_image' => req::item('home_image', ''),
            'images' => req::item('images', ''),
            'price' => req::item('price', 0),
            'market_price' => req::item('market_price', 0),
            'stock' => req::item('stock', 0),
            'is_hot' => req::item('is_hot', 0),
            'is_new' => req::item('is_new', 0),
            'is_recommend' => req::item('is_recommend', 0),
            'is_home_show' => req::item('is_home_show', 0),
            'status' => req::item('status', 1),
            'sort' => req::item('sort', 0),
        );
        
        if (empty($data['goods_name'])) {
            cls_msgbox::show('', '商品名称不能为空', '-1');
            return;
        }
        
        if ($data['cid'] <= 0) {
            cls_msgbox::show('', '请选择商品分类', '-1');
            return;
        }
        
        if ($id > 0) {
            $data['update_time'] = time();
            db::update('shop_goods', $data, "id={$id}");
            $msg = '修改成功！';
        } else {
            $data['create_time'] = time();
            db::insert('shop_goods', $data);
            $msg = '添加成功！';
        }
        
        cls_msgbox::show('', $msg, '?ct=shop_admin&ac=goods_list');
    }
    
    /**
     * 删除商品
     */
    private function delete_goods()
    {
        $id = req::item('id', 0);
        
        if ($id <= 0) {
            cls_msgbox::show('', '参数错误', '-1');
            return;
        }
        
        // 删除商品
        db::query("DELETE FROM shop_goods WHERE id={$id}");
        
        // 删除规格
        db::query("DELETE FROM shop_goods_spec WHERE goods_id={$id}");
        
        cls_msgbox::show('', '删除成功！', '?ct=shop_admin&ac=goods_list');
    }
    
    /**
     * 更新商品状态
     */
    private function update_goods_status()
    {
        $id = req::item('id', 0);
        $status = req::item('status', 0);
        
        if ($id <= 0) {
            cls_msgbox::show('', '参数错误', '-1');
            return;
        }
        
        db::update('shop_goods', array('status' => $status), "id={$id}");
        
        cls_msgbox::show('', '操作成功！', '?ct=shop_admin&ac=goods_list');
    }

    /**
     * 订单管理
     */
    public function order_list()
    {
        $action = req::item('action', '');
        
        if ($action == 'detail') {
            $this->order_detail();
            return;
        }
        
        // 获取筛选条件
        $order_no = req::item('order_no', '');
        $pay_status = req::item('pay_status', '');
        $ship_status = req::item('ship_status', '');
        $page = req::item('page', 1);
        $pagesize = 20;
        
        $where = "1=1";
        $params = array();
        
        if ($order_no) {
            $where .= " AND order_no LIKE ?";
            $params[] = '%' . $order_no . '%';
        }
        
        if ($pay_status !== '') {
            $where .= " AND pay_status=?";
            $params[] = $pay_status;
        }
        
        if ($ship_status !== '') {
            $where .= " AND ship_status=?";
            $params[] = $ship_status;
        }
        
        // 获取总数
        $count_sql = "SELECT COUNT(*) as total FROM shop_order WHERE {$where}";
        $total = db::get_one($count_sql, $params);
        
        // 获取列表
        $offset = ($page - 1) * $pagesize;
        $sql = "SELECT * FROM shop_order 
                WHERE {$where}
                ORDER BY create_time DESC 
                LIMIT {$offset}, {$pagesize}";
        $list = db::get_all($sql, $params);
        
        // 获取订单商品
        foreach ($list as &$order) {
            $goods_sql = "SELECT * FROM shop_order_goods WHERE order_id=?";
            $order['goods_list'] = db::get_all($goods_sql, array($order['id']));
        }
        
        tpl::assign('list', $list);
        tpl::assign('total', $total['total']);
        tpl::assign('page', $page);
        tpl::assign('pagesize', $pagesize);
        tpl::assign('order_no', $order_no);
        tpl::assign('pay_status', $pay_status);
        tpl::assign('ship_status', $ship_status);
        tpl::assign('web_title', "订单管理");
        tpl::display('shop.order_list.html');
    }
    
    /**
     * 订单详情
     */
    public function order_detail()
    {
        $order_no = req::item('order_no', '');
        
        if (empty($order_no)) {
            echo '订单号不能为空';
            exit;
        }
        
        // 直接查询，避免预处理问题
        $sql = "SELECT * FROM shop_order WHERE order_no='{$order_no}'";
        $order = db::queryone($sql);
        
        if (!$order) {
            // 显示更详细的错误信息
            echo '订单不存在，订单号：' . $order_no . '<br>';
            echo '请检查订单号是否正确';
            exit;
        }
        
        // 获取订单商品 - 使用order_id关联
        $goods_sql = "SELECT * FROM shop_order_goods WHERE order_id={$order['id']}";
        $goods_list = db::querylist($goods_sql);
        
        // 将商品列表添加到订单数组中
        $order['goods_list'] = $goods_list;
        
        // 格式化时间
        if ($order['create_time']) {
            $order['create_time_format'] = date('Y-m-d H:i:s', $order['create_time']);
        }
        if ($order['pay_time']) {
            $order['pay_time_format'] = date('Y-m-d H:i:s', $order['pay_time']);
        }
        
        tpl::assign('order', $order);
        tpl::assign('web_title', "订单详情");
        tpl::display('shop.order_detail.html');
    }
    
    /**
     * 待发货订单
     */
    public function order_ship()
    {
        $action = req::item('action', '');
        
        if ($action == 'ship') {
            $this->do_ship();
            return;
        }
        
        // 获取待发货订单
        $page = req::item('page', 1);
        $pagesize = 20;
        
        $where = "pay_status=1 AND ship_status=0";
        
        // 获取总数
        $count_sql = "SELECT COUNT(*) as total FROM shop_order WHERE {$where}";
        $total = db::get_one($count_sql);
        
        // 获取列表
        $offset = ($page - 1) * $pagesize;
        $sql = "SELECT * FROM shop_order 
                WHERE {$where}
                ORDER BY pay_time ASC 
                LIMIT {$offset}, {$pagesize}";
        $list = db::get_all($sql);
        
        // 获取订单商品
        foreach ($list as &$order) {
            $goods_sql = "SELECT * FROM shop_order_goods WHERE order_id=?";
            $order['goods_list'] = db::get_all($goods_sql, array($order['id']));
        }
        
        tpl::assign('list', $list);
        tpl::assign('total', $total['total']);
        tpl::assign('page', $page);
        tpl::assign('pagesize', $pagesize);
        tpl::assign('web_title', "待发货订单");
        tpl::display('shop.order_ship.html');
    }
    
    /**
     * 发货
     */
    private function do_ship()
    {
        $order_no = req::item('order_no', '');
        $express_company = req::item('express_company', '');
        $express_no = req::item('express_no', '');
        
        if (empty($order_no)) {
            echo json_encode(array('code' => 0, 'msg' => '订单号不能为空'));
            exit;
        }
        
        if (empty($express_company) || empty($express_no)) {
            echo json_encode(array('code' => 0, 'msg' => '请填写快递公司和快递单号'));
            exit;
        }
        
        $sql = "UPDATE shop_order SET ship_status=1, ship_time=".time().", express_company='{$express_company}', express_no='{$express_no}', update_time=".time()." WHERE order_no='{$order_no}'";
        db::query($sql);
        
        echo json_encode(array('code' => 1, 'msg' => '发货成功'));
        exit;
    }
    
    /**
     * 修改订单支付状态
     */
    public function update_pay_status()
    {
        $order_no = req::item('order_no', '');
        $status = req::item('status', 0);
        
        if(empty($order_no)) {
            cls_msgbox::show('', '订单号不能为空', '-1');
            return;
        }
        
        // 获取订单信息
        $order = db::queryone("SELECT * FROM shop_order WHERE order_no='{$order_no}'");
        if(!$order) {
            cls_msgbox::show('', '订单不存在', '-1');
            return;
        }
        
        // 更新支付状态
        $update_data = array(
            'pay_status' => $status,
            'update_time' => time()
        );
        
        // 如果标记为已支付，设置支付时间
        if($status == 1 && $order['pay_status'] == 0) {
            $update_data['pay_time'] = time();
        }
        
        db::update('shop_order', $update_data, "order_no='{$order_no}'");
        
        $msg = $status == 1 ? '已标记为已支付' : '已标记为未支付';
        cls_msgbox::show('', $msg, '?ct=shop_admin&ac=order_list');
    }
    
    /**
     * 删除订单
     */
    public function delete_order()
    {
        $order_no = req::item('order_no', '');
        
        if(empty($order_no)) {
            cls_msgbox::show('', '订单号不能为空', '-1');
            return;
        }
        
        // 获取订单信息
        $order = db::queryone("SELECT * FROM shop_order WHERE order_no='{$order_no}'");
        if(!$order) {
            cls_msgbox::show('', '订单不存在', '-1');
            return;
        }
        
        // 删除订单
        db::query("DELETE FROM shop_order WHERE order_no='{$order_no}'");
        
        // 删除订单商品
        db::query("DELETE FROM shop_order_goods WHERE order_id={$order['id']}");
        
        cls_msgbox::show('', '订单删除成功！', '?ct=shop_admin&ac=order_list');
    }
    
    /**
     * 销售统计
     */
    public function statistics()
    {
        // 今日统计
        $today_start = strtotime(date('Y-m-d 00:00:00'));
        $today_end = strtotime(date('Y-m-d 23:59:59'));
        
        $today_order = db::get_one("SELECT COUNT(*) as total, SUM(pay_price) as amount FROM shop_order WHERE pay_status=1 AND pay_time>={$today_start} AND pay_time<={$today_end}");
        
        // 本月统计
        $month_start = strtotime(date('Y-m-01 00:00:00'));
        $month_end = strtotime(date('Y-m-t 23:59:59'));
        
        $month_order = db::get_one("SELECT COUNT(*) as total, SUM(pay_price) as amount FROM shop_order WHERE pay_status=1 AND pay_time>={$month_start} AND pay_time<={$month_end}");
        
        // 总统计
        $total_order = db::get_one("SELECT COUNT(*) as total, SUM(pay_price) as amount FROM shop_order WHERE pay_status=1");
        
        // 商品销量排行
        $goods_rank = db::get_all("SELECT g.goods_name, g.thumb, SUM(og.num) as total_num, SUM(og.total_price) as total_amount 
                                   FROM shop_order_goods og 
                                   LEFT JOIN shop_goods g ON og.goods_id=g.id 
                                   LEFT JOIN shop_order o ON og.order_id=o.id 
                                   WHERE o.pay_status=1 
                                   GROUP BY og.goods_id 
                                   ORDER BY total_num DESC 
                                   LIMIT 10");
        
        tpl::assign('today_order', $today_order);
        tpl::assign('month_order', $month_order);
        tpl::assign('total_order', $total_order);
        tpl::assign('goods_rank', $goods_rank);
        tpl::assign('web_title', "销售统计");
        tpl::display('shop.statistics.html');
    }
}
