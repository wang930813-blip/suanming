<?php
/**
 * 商城模型类
 * 用于处理商城相关的数据操作
 */
class mod_shop {
    
    /**
     * 获取商品分类列表
     */
    public function getCategoryList($pid = 0) {
        $sql = "SELECT * FROM shop_category WHERE status=1 AND pid={$pid} ORDER BY sort ASC, id DESC";
        return db::get_all($sql);
    }
    
    /**
     * 获取所有分类树形结构
     */
    public function getCategoryTree() {
        $sql = "SELECT * FROM shop_category WHERE status=1 ORDER BY sort ASC, id ASC";
        $list = db::get_all($sql);
        
        if (!$list) {
            return array();
        }
        
        $tree = array();
        foreach ($list as $item) {
            if ($item['pid'] == 0) {
                $item['children'] = array();
                foreach ($list as $child) {
                    if ($child['pid'] == $item['id']) {
                        $item['children'][] = $child;
                    }
                }
                $tree[] = $item;
            }
        }
        return $tree;
    }
    
    /**
     * 获取商品列表
     */
    public function getGoodsList($params = array()) {
        $where = "WHERE g.status=1";
        
        // 分类筛选
        if (!empty($params['cid'])) {
            $cid = intval($params['cid']);
            $where .= " AND g.cid={$cid}";
        }
        
        // 类型筛选
        if (isset($params['goods_type'])) {
            $goods_type = intval($params['goods_type']);
            $where .= " AND g.goods_type={$goods_type}";
        }
        
        // 热卖
        if (!empty($params['is_hot'])) {
            $where .= " AND g.is_hot=1";
        }
        
        // 新品
        if (!empty($params['is_new'])) {
            $where .= " AND g.is_new=1";
        }
        
        // 推荐
        if (!empty($params['is_recommend'])) {
            $where .= " AND g.is_recommend=1";
        }
        
        // 搜索
        if (!empty($params['keyword'])) {
            $keyword = addslashes($params['keyword']);
            $where .= " AND g.goods_name LIKE '%{$keyword}%'";
        }
        
        // 排序
        $order = "ORDER BY g.sort ASC, g.id DESC";
        if (!empty($params['order'])) {
            switch ($params['order']) {
                case 'price_asc':
                    $order = "ORDER BY g.price ASC";
                    break;
                case 'price_desc':
                    $order = "ORDER BY g.price DESC";
                    break;
                case 'sales':
                    $order = "ORDER BY g.sales DESC";
                    break;
            }
        }
        
        // 分页
        $page = isset($params['page']) ? intval($params['page']) : 1;
        $pagesize = isset($params['pagesize']) ? intval($params['pagesize']) : 20;
        $offset = ($page - 1) * $pagesize;
        
        $sql = "SELECT g.*, c.name as category_name 
                FROM shop_goods g 
                LEFT JOIN shop_category c ON g.cid=c.id 
                {$where} {$order} 
                LIMIT {$offset}, {$pagesize}";
        
        $list = db::get_all($sql);
        if (!$list) {
            $list = array();
        }
        
        // 获取总数
        $count_sql = "SELECT COUNT(*) as total FROM shop_goods g {$where}";
        $total_result = db::get_one($count_sql);
        $total = $total_result ? $total_result['total'] : 0;
        
        return array(
            'list' => $list,
            'total' => $total,
            'page' => $page,
            'pagesize' => $pagesize
        );
    }
    
    /**
     * 获取商品详情
     */
    public function getGoodsDetail($id) {
        $id = intval($id);
        $sql = "SELECT g.*, c.name as category_name 
                FROM shop_goods g 
                LEFT JOIN shop_category c ON g.cid=c.id 
                WHERE g.id={$id} AND g.status=1";
        $goods = db::get_one($sql);
        
        if ($goods) {
            // 获取商品规格
            $spec_sql = "SELECT * FROM shop_goods_spec WHERE goods_id={$id}";
            $specs = db::get_all($spec_sql);
            $goods['specs'] = $specs ? $specs : array();
            
            // 增加浏览量
            db::query("UPDATE shop_goods SET views=views+1 WHERE id={$id}");
        }
        
        return $goods;
    }
    
    /**
     * 添加到购物车
     */
    public function addToCart($uid, $goods_id, $spec_id = 0, $num = 1) {
        // 检查是否已在购物车
        $sql = "SELECT * FROM shop_cart WHERE uid=? AND goods_id=? AND spec_id=?";
        $cart = $this->getOne($sql, array($uid, $goods_id, $spec_id));
        
        if ($cart) {
            // 更新数量
            $update_sql = "UPDATE shop_cart SET num=num+?, create_time=? WHERE id=?";
            return $this->query($update_sql, array($num, time(), $cart['id']));
        } else {
            // 新增
            $insert_sql = "INSERT INTO shop_cart (uid, goods_id, spec_id, num, create_time) VALUES (?, ?, ?, ?, ?)";
            return $this->query($insert_sql, array($uid, $goods_id, $spec_id, $num, time()));
        }
    }
    
    /**
     * 获取购物车列表
     */
    public function getCartList($uid) {
        $sql = "SELECT c.*, g.goods_name, g.thumb, g.price, g.stock, g.status as goods_status
                FROM shop_cart c 
                LEFT JOIN shop_goods g ON c.goods_id=g.id 
                WHERE c.uid=?
                ORDER BY c.create_time DESC";
        $list = $this->getAll($sql, array($uid));
        
        // 处理规格信息
        foreach ($list as &$item) {
            if ($item['spec_id'] > 0) {
                $spec_sql = "SELECT * FROM shop_goods_spec WHERE id=?";
                $spec = $this->getOne($spec_sql, array($item['spec_id']));
                $item['spec_info'] = $spec;
                if ($spec && $spec['price']) {
                    $item['price'] = $spec['price'];
                }
            }
        }
        
        return $list;
    }
    
    /**
     * 更新购物车数量
     */
    public function updateCartNum($cart_id, $num) {
        $sql = "UPDATE shop_cart SET num=? WHERE id=?";
        return $this->query($sql, array($num, $cart_id));
    }
    
    /**
     * 删除购物车商品
     */
    public function deleteCart($cart_id) {
        $sql = "DELETE FROM shop_cart WHERE id=?";
        return $this->query($sql, array($cart_id));
    }
    
    /**
     * 创建订单（购物车下单）
     * 🔴 修复：使用 db:: 方法替代未定义的 $this->getOne() / $this->getAll() / $this->query()
     */
    public function createOrder($uid, $cart_ids, $address_id, $remark = '') {
        // 获取购物车商品
        $cart_ids_safe = array_map('intval', $cart_ids);
        $cart_ids_str = implode(',', $cart_ids_safe);
        $uid_safe = intval($uid);
        
        $cart_sql = "SELECT c.*, g.goods_name, g.thumb, g.price, g.stock, g.goods_type
                     FROM shop_cart c 
                     LEFT JOIN shop_goods g ON c.goods_id=g.id 
                     WHERE c.id IN ({$cart_ids_str}) AND c.uid={$uid_safe}";
        $cart_list = db::get_all($cart_sql);
        
        if (empty($cart_list)) {
            return array('code' => 0, 'msg' => '购物车为空');
        }
        
        // 获取收货地址
        $address_sql = "SELECT * FROM shop_address WHERE id=" . intval($address_id) . " AND uid={$uid_safe}";
        $address = db::get_one($address_sql);
        
        if (!$address) {
            return array('code' => 0, 'msg' => '收货地址不存在');
        }
        
        // 计算总价
        $total_price = 0;
        foreach ($cart_list as $item) {
            $price = floatval($item['price']);
            if ($item['spec_id'] > 0) {
                $spec_sql = "SELECT price FROM shop_goods_spec WHERE id=" . intval($item['spec_id']);
                $spec = db::get_one($spec_sql);
                if ($spec && floatval($spec['price']) > 0) {
                    $price = floatval($spec['price']);
                }
            }
            $total_price += $price * intval($item['num']);
        }
        
        // 生成订单号（统一用系统的订单号格式，type=99 表示商城）
        $order_no = mod_order::createoid(99);
        $time = time();
        $ship_address = addslashes($address['province'] . $address['city'] . $address['district'] . $address['address']);
        $ship_name = addslashes($address['name']);
        $ship_mobile = addslashes($address['mobile']);
        $remark_safe = addslashes($remark);
        
        // 1. 插入系统订单表 ffsm_orders（用于支付）
        $order_desc = '';
        $goods_names = array();
        foreach ($cart_list as $item) {
            $goods_names[] = $item['goods_name'] . ' x' . $item['num'];
        }
        $order_desc = addslashes(implode('; ', $goods_names));
        
        $ffsm_data = array(
            'oid' => $order_no,
            'type' => 99,
            'uid' => $uid_safe,
            'username' => $ship_name,
            'money' => $total_price,
            'des' => $order_desc,
            'status' => 0,
            'createtime' => date('Y-m-d H:i:s', $time),
            'ip' => util::get_client_ip()
        );
        $ffsm_result = db::insert('ffsm_orders', $ffsm_data);
        
        if (!$ffsm_result) {
            return array('code' => 0, 'msg' => '支付订单创建失败');
        }
        
        // 2. 插入商城订单表 shop_order
        $shop_order_sql = "INSERT INTO shop_order SET 
            order_no='{$order_no}',
            uid={$uid_safe},
            total_price={$total_price},
            pay_price={$total_price},
            pay_status=0,
            ship_status=0,
            ship_name='{$ship_name}',
            ship_mobile='{$ship_mobile}',
            ship_address='{$ship_address}',
            remark='{$remark_safe}',
            status=1,
            create_time={$time}";
        db::query($shop_order_sql);
        $order_id = db::insert_id();
        
        // 3. 插入订单商品表
        foreach ($cart_list as $item) {
            $goods_id = intval($item['goods_id']);
            $goods_name = addslashes($item['goods_name']);
            $goods_thumb = addslashes($item['thumb']);
            $spec_id = intval($item['spec_id']);
            $num = intval($item['num']);
            $price = floatval($item['price']);
            
            $spec_name = '';
            if ($spec_id > 0) {
                $spec = db::get_one("SELECT * FROM shop_goods_spec WHERE id={$spec_id}");
                if ($spec) {
                    if (floatval($spec['price']) > 0) {
                        $price = floatval($spec['price']);
                    }
                    $spec_name = addslashes($spec['spec_name'] . ': ' . $spec['spec_value']);
                }
            }
            
            $goods_sql = "INSERT INTO shop_order_goods SET 
                order_id={$order_id},
                order_no='{$order_no}',
                goods_id={$goods_id},
                goods_name='{$goods_name}',
                goods_thumb='{$goods_thumb}',
                spec_id={$spec_id},
                spec_name='{$spec_name}',
                price={$price},
                num={$num},
                total_price=" . ($price * $num);
            db::query($goods_sql);
            
            // 减库存
            db::query("UPDATE shop_goods SET stock=stock-{$num}, sales=sales+{$num} WHERE id={$goods_id}");
        }
        
        // 清空购物车
        db::query("DELETE FROM shop_cart WHERE id IN ({$cart_ids_str})");
        
        return array('code' => 1, 'msg' => '订单创建成功', 'order_no' => $order_no, 'order_id' => $order_id);
    }
    
    /**
     * 获取订单列表
     */
    public function getOrderList($uid, $params = array()) {
        $where = "WHERE uid=?";
        $bind = array($uid);
        
        // 支付状态筛选
        if (isset($params['pay_status'])) {
            $where .= " AND pay_status=?";
            $bind[] = $params['pay_status'];
        }
        
        // 发货状态筛选
        if (isset($params['ship_status'])) {
            $where .= " AND ship_status=?";
            $bind[] = $params['ship_status'];
        }
        
        $sql = "SELECT * FROM shop_order {$where} ORDER BY create_time DESC";
        $list = $this->getAll($sql, $bind);
        
        // 获取订单商品
        foreach ($list as &$order) {
            $goods_sql = "SELECT * FROM shop_order_goods WHERE order_id=?";
            $order['goods_list'] = $this->getAll($goods_sql, array($order['id']));
        }
        
        return $list;
    }
    
    /**
     * 获取订单详情
     */
    public function getOrderDetail($order_no, $uid = 0) {
        $sql = "SELECT * FROM shop_order WHERE order_no=?";
        $bind = array($order_no);
        
        if ($uid > 0) {
            $sql .= " AND uid=?";
            $bind[] = $uid;
        }
        
        $order = $this->getOne($sql, $bind);
        
        if ($order) {
            $goods_sql = "SELECT * FROM shop_order_goods WHERE order_no=?";
            $order['goods_list'] = $this->getAll($goods_sql, array($order_no));
        }
        
        return $order;
    }
    
    /**
     * 更新订单支付状态
     */
    public function updateOrderPayStatus($order_no, $pay_type = '') {
        $sql = "UPDATE shop_order SET pay_status=1, pay_time=?, pay_type=? WHERE order_no=?";
        return $this->query($sql, array(time(), $pay_type, $order_no));
    }
    
    /**
     * 添加收藏
     */
    public function addFavorite($uid, $goods_id) {
        // 检查是否已收藏
        $sql = "SELECT * FROM shop_favorite WHERE uid=? AND goods_id=?";
        $exist = $this->getOne($sql, array($uid, $goods_id));
        
        if ($exist) {
            return array('code' => 0, 'msg' => '已经收藏过了');
        }
        
        $insert_sql = "INSERT INTO shop_favorite (uid, goods_id, create_time) VALUES (?, ?, ?)";
        $this->query($insert_sql, array($uid, $goods_id, time()));
        
        return array('code' => 1, 'msg' => '收藏成功');
    }
    
    /**
     * 取消收藏
     */
    public function deleteFavorite($uid, $goods_id) {
        $sql = "DELETE FROM shop_favorite WHERE uid=? AND goods_id=?";
        return $this->query($sql, array($uid, $goods_id));
    }
    
    /**
     * 获取收藏列表
     */
    public function getFavoriteList($uid) {
        $sql = "SELECT f.*, g.goods_name, g.thumb, g.price, g.status
                FROM shop_favorite f 
                LEFT JOIN shop_goods g ON f.goods_id=g.id 
                WHERE f.uid=?
                ORDER BY f.create_time DESC";
        return $this->getAll($sql, array($uid));
    }
    
    /**
     * 添加浏览历史
     */
    public function addHistory($uid, $goods_id) {
        // 删除旧记录
        $delete_sql = "DELETE FROM shop_history WHERE uid=? AND goods_id=?";
        $this->query($delete_sql, array($uid, $goods_id));
        
        // 添加新记录
        $insert_sql = "INSERT INTO shop_history (uid, goods_id, create_time) VALUES (?, ?, ?)";
        return $this->query($insert_sql, array($uid, $goods_id, time()));
    }
    
    /**
     * 获取浏览历史
     */
    public function getHistoryList($uid, $limit = 20) {
        $sql = "SELECT h.*, g.goods_name, g.thumb, g.price, g.status
                FROM shop_history h 
                LEFT JOIN shop_goods g ON h.goods_id=g.id 
                WHERE h.uid=?
                ORDER BY h.create_time DESC
                LIMIT {$limit}";
        return $this->getAll($sql, array($uid));
    }
    
    /**
     * 获取用户地址列表
     */
    public function getAddressList($uid) {
        $sql = "SELECT * FROM shop_address WHERE uid=? ORDER BY is_default DESC, create_time DESC";
        return $this->getAll($sql, array($uid));
    }
    
    /**
     * 获取地址详情
     */
    public function getAddressDetail($id, $uid) {
        $sql = "SELECT * FROM shop_address WHERE id=? AND uid=?";
        return $this->getOne($sql, array($id, $uid));
    }
    
    /**
     * 添加地址
     */
    public function addAddress($data) {
        // 如果设为默认，清除其他默认地址
        if ($data['is_default'] == 1) {
            $this->query("UPDATE shop_address SET is_default=0 WHERE uid=?", array($data['uid']));
        }
        
        $sql = "INSERT INTO shop_address (uid, name, mobile, province, city, district, address, is_default, create_time) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return $this->query($sql, array(
            $data['uid'],
            $data['name'],
            $data['mobile'],
            $data['province'],
            $data['city'],
            $data['district'],
            $data['address'],
            $data['is_default'],
            time()
        ));
    }
    
    /**
     * 更新地址
     */
    public function updateAddress($id, $uid, $data) {
        // 如果设为默认，清除其他默认地址
        if ($data['is_default'] == 1) {
            $this->query("UPDATE shop_address SET is_default=0 WHERE uid=?", array($uid));
        }
        
        $sql = "UPDATE shop_address SET name=?, mobile=?, province=?, city=?, district=?, address=?, is_default=? WHERE id=? AND uid=?";
        return $this->query($sql, array(
            $data['name'],
            $data['mobile'],
            $data['province'],
            $data['city'],
            $data['district'],
            $data['address'],
            $data['is_default'],
            $id,
            $uid
        ));
    }
    
    /**
     * 删除地址
     */
    public function deleteAddress($id, $uid) {
        $sql = "DELETE FROM shop_address WHERE id=? AND uid=?";
        return $this->query($sql, array($id, $uid));
    }
}
