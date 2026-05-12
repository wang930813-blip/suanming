<?php
if (!defined('CORE')) {
    exit('Request Error!');
}

class mod_order
{

    /***
     * @param $type
     * 生成订单单号
     * 修复：增加随机性，防止订单号可预测
     */
    public static function createoid($type)
    {
        // 格式：type + 年月日时分秒 + 6位随机数（含微秒+强随机）
        list($usec, $sec) = explode(' ', microtime());
        $rand_part = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
        $oid = '' . $type . date('YmdHis') . substr($usec, 2, 3) . $rand_part;
        return $oid;
    }


    /***
     * 转换日期
     * 旧历转新历
     * 格式
     * 2017年正月十三 05:00-05:59卯时
     */
    public static function datereplace($time)
    {
        $yue1 = array('正月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月');
        $yue2 = array('1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月');

        $ri1 = array('初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十', '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十', '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十', '三十一');
        $ri2 = array('1日', '2日', '3日', '4日', '5日', '6日', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31');

        return $time;
    }

    /***
     * @param $data
     * @return string
     * 根据type生成标题
     */
    public static function makeordertitle($data)
    {

        $title = '八字合婚';

        if ($data['type'] == '36') {
            $title = $data['username'] . '星座命盘详解';
        } elseif ($data['type'] == '37') {
            $title = $data['username'] . '2026年星座运势';
        } elseif ($data['type'] == '26') {
            $title = $data['username'] . '塔罗牌-未来运势大揭秘';
        } elseif ($data['type'] == '27') {
            $title = $data['username'] . '塔罗牌-暗恋的人喜欢你吗？';
        } elseif ($data['type'] == '28') {
            $title = $data['username'] . '塔罗牌-TA心里有没有你？';
        } elseif ($data['type'] == '29') {
            $title = $data['username'] . '塔罗牌-和TA该继续走下去吗？';
        } elseif ($data['type'] == '30') {
            $title = $data['username'] . '塔罗牌-感情运势大揭秘';
        } elseif ($data['type'] == '31') {
            $title = $data['username'] . '塔罗牌-能在三个月内脱单吗？';
        } elseif ($data['type'] == '32') {
            $title = $data['username'] . '塔罗牌-你们会复合吗？';
        } elseif ($data['type'] == '33') {
            $title = $data['username'] . '塔罗牌-你们能走到最后吗？';
        } elseif ($data['type'] == '34') {
            $title = $data['username'] . '塔罗牌-你们该分手吗？';
        } elseif ($data['type'] == '35') {
            $title = $data['username'] . '塔罗牌-TA心里有别人吗？';
        } elseif ($data['type'] == '12') {
            // 今年运程
            $title = $data['username'] . '的2026马年运势';
        } elseif ($data['type'] == '38') {
            // 塔罗问答：使用用户的问题作为标题
            if (isset($data['datas']['question']) && !empty($data['datas']['question'])) {
                $question = $data['datas']['question'];
                // 限制标题长度，避免过长
                if (mb_strlen($question, 'utf-8') > 30) {
                    $question = mb_substr($question, 0, 30, 'utf-8') . '...';
                }
                $title = '塔罗问答：' . $question;
            } else {
                $title = '塔罗问答';
            }
        }

        return $title;
    }
    public static function add_order_talou($data)
    {


        $dl_id = isset($_COOKIE["dl"]) ? intval($_COOKIE["dl"]) : 0;
        $user_name = isset($_COOKIE['user_name']) ? addslashes($_COOKIE['user_name']) : '';
        $pay_uid = 0;
        if (!empty($user_name)) {
            $result = db::get_one("select * from `users` where `user_name`='" . $user_name . "'");
            $pay_uid = $result ? $result['uid'] : 0;
        }
        if ($dl_id > 0) {
            $tcbl_row = db::get_one("SELECT * FROM `users` WHERE `uid` = '" . $dl_id . "'");
            if ($tcbl_row && $tcbl_row['dl_tcbl'] > 0) {
                $hdjf = round($data['money'] * $tcbl_row['dl_tcbl'] / 100, 2);
            } else {
                $hdjf = round($data['money'] * $GLOBALS['config']['money']['oneclass'] / 100, 2);
            }
        } else {
            $hdjf = 0;
        }

        //整理数据
        $orders['oid'] = $data['oid'];
        $orders['type'] = $data['type'];
        $orders['data'] = urlencode(json_encode($data['datas']));
        $orders['uid'] = $dl_id;
        $orders['money'] = $data['money'];
        $orders['dl_money'] = $hdjf;
        $orders['pay_uid'] = $pay_uid;

        $orders['des'] = self::makeordertitle($data);
        $orders['createtime'] = time();
        $orders['ip'] = util::get_client_ip();
        // 设置0元，直接跳转到结果！ 2024修改
        if ($orders['money'] == 0) {
            $orders['status'] = 1;
        }
        $reo = db::ins('ffsm_orders', $orders);
        self::set_history($data['oid']);
        return $reo;
    }
    public static function add_order($data)
    {
        // 设置0元，直接跳转到结果！ 2024修改
        if ($data['money'] == 0) {
            $data['status'] = 1;
        }
        $reo = db::insert('ffsm_orders', $data);
        return $reo;
    }
    public static function get_order($id)
    {
        // 修复：防止 SQL 注入
        $safe_id = addslashes($id);
        $oinfo = db::queryone("select * from `ffsm_orders` where oid='$safe_id'");
        return $oinfo;
    }
    public static function up_order($data, $where)
    {
        return db::update('ffsm_orders', $data, $where);
    }


    public static function set_history($oid)
    {

        $history = self::get_history();
        if ($history == '') {
            $cookies = array('ord_history' => array($oid));
            $cookies_s = json_encode($cookies);
            setCookie('ord_history', $cookies_s);
        } else {
            if (!in_array($oid, $history)) {
                $new_history = array_merge($history, array($oid));
                $cookies = array('ord_history' => $new_history);
                $cookies_s = json_encode($cookies);
                setCookie('ord_history', $cookies_s);
            }
        }
        return true;
    }


    public static function get_history()
    {
        $history = $_COOKIE['ord_history'];
        if (empty($history)) {
            return '';
        }
        $history = json_decode(str_replace('\"', '"', $history), true);
        return $history['ord_history'];
    }
    /***
     *内容页分页
     */

    public static function typetochannel($type)
    {
        if ($type == 1) {
            $ac = 'bazi';
        } elseif ($type == 2) {
            $ac = 'hehun';
        } elseif ($type == 3) {
            $ac = 'xmfx';
        } elseif ($type == 4) {
            $ac = 'xmpd';
        } elseif ($type == 5) {
            $ac = 'ziwei';
        } elseif ($type == 6) {
            $ac = 'bazizh';
        } elseif ($type == 7) {
            $ac = 'yinyuancs';
        } elseif ($type == 8) {
            $ac = 'bazijp';
        } elseif ($type == 9) {
            $ac = 'aiqingyun';
        } elseif ($type == 10) {
            $ac = 'pc';
        } elseif ($type == 11) {
            $ac = 'shengxiao';
        } elseif ($type == 12) {
            $ac = 'jinnian';
        } elseif ($type == 13) {
            $ac = 'sndy';
        } elseif ($type == 14) {
            $ac = 'cyxp';
        } elseif ($type == 15) {
            $ac = 'xys';
        } elseif ($type == 16) {
            $ac = 'bzyy';
        } elseif ($type == 17) {
            $ac = 'bzhh';
        } elseif ($type == 18) {
            $ac = 'hmjx';
        } elseif ($type == 20) {
            $ac = 'qiming';
        } elseif ($type == 21) {
            $ac = 'xydd';
        } elseif ($type == 22) {
            $ac = 'hmjx';
        } elseif ($type == 23) {
            $ac = 'ffqm';
        } elseif ($type == 24) {
            $ac = 'gsqm';
        } elseif ($type == 25) {
            $ac = 'dashi';
        } elseif ($type == 26) {
            $ac = 'taluoyunshi';
        } elseif ($type == 27) {
            $ac = 'taluoanlian';
        } elseif ($type == 28) {
            $ac = 'taluoxinli';
        } elseif ($type == 29) {
            $ac = 'taluojixu';
        } elseif ($type == 30) {
            $ac = 'taluoaiqing';
        } elseif ($type == 31) {
            $ac = 'taluotuodan';
        } elseif ($type == 32) {
            $ac = 'taluofuhe';
        } elseif ($type == 33) {
            $ac = 'taluozuihou';
        } elseif ($type == 34) {
            $ac = 'taluofenshou';
        } elseif ($type == 35) {
            $ac = 'taluobieren';
        } elseif ($type == 36) {
            $ac = 'xingpan';
        } elseif ($type == 37) {
            $ac = 'xingzuo';
        } elseif ($type == 38) {
            $ac = 'taluowenda';
        } elseif ($type == 39 || $type == 40) {
            $ac = 'vip';
        } elseif ($type == 301) {
            $ac = 'rtcaiyun';
        } elseif ($type == 302) {
            $ac = 'ssxo';
        } elseif ($type == 303) {
            $ac = 'ssjf';
        } elseif ($type == 304) {
            $ac = 'ssjs';
        } elseif ($type == 305) {
            $ac = 'ssjk';
        } elseif ($type == 306) {
            $ac = 'ssjj';
        } elseif ($type == 307) {
            $ac = 'sslg';
        } elseif ($type == 308) {
            $ac = 'ssnvp';
        } elseif ($type == 309) {
            $ac = 'ssnnp';
        } elseif ($type == 310) {
            $ac = 'ssvvp';
        } elseif ($type == 311) {
            $ac = 'sscwy';
        } elseif ($type == 312) {
            $ac = 'sssx';
        } elseif ($type == 99) {
            // 商城订单，返回特殊标记
            $ac = 'shop_order';
        } elseif ($type == 999 || $type == '999') {
            // 择吉日订单
            $ac = 'zejiri_result';
        } elseif ($type == 'zejiri' || $type === 'zejiri') {
            // 择吉日订单（兼容旧方式）
            $ac = 'zejiri_result';
        } else {
            // 默认返回空
            $ac = '';
        }
        return $ac;
    }
    public static function type_ssname($type)
    {
        $arr = array();
        $arr[301] = "实时财运";
        $arr[302] = "实时寻偶";
        $arr[303] = "实时减肥";
        $arr[304] = "实时健身";
        $arr[305] = "实时健康";
        $arr[306] = "实时竞技";
        $arr[307] = "实时灵感";
        $arr[308] = "实时男女配";
        $arr[309] = "实时男男配";
        $arr[310] = "实时女女配";
        $arr[311] = "实时查外遇";
        $arr[312] = "实时速学";
        return $arr[$type];
    }
}
