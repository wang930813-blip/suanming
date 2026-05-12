<?php
if (!defined('CORE')) exit('Request Error!');

/**
 * 农历转换类 - 精确的农历计算（1900-2100年）
 */
class cls_lunar_calendar
{
    // 农历数据表（1900-2100年）
    // 每个数字表示一年的农历信息（闰月、大小月等）
    private static $lunar_info = array(
        0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2,
        0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977,
        0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970,
        0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950,
        0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557,
        0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5b0, 0x14573, 0x052b0, 0x0a9a8, 0x0e950, 0x06aa0,
        0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0,
        0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b6a0, 0x195a6,
        0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570,
        0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5, 0x092e0,
        0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5,
        0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930,
        0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530,
        0x05aa0, 0x076a3, 0x096d0, 0x04afb, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45,
        0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0,
        0x14b63, 0x09370, 0x049f8, 0x04970, 0x064b0, 0x168a6, 0x0ea50, 0x06b20, 0x1a6c4, 0x0aae0,
        0x0a2e0, 0x0d2e3, 0x0c960, 0x0d557, 0x0d4a0, 0x0da50, 0x05d55, 0x056a0, 0x0a6d0, 0x055d4,
        0x052d0, 0x0a9b8, 0x0a950, 0x0b4a0, 0x0b6a6, 0x0ad50, 0x055a0, 0x0aba4, 0x0a5b0, 0x052b0,
        0x0b273, 0x06930, 0x07337, 0x06aa0, 0x0ad50, 0x14b55, 0x04b60, 0x0a570, 0x054e4, 0x0d160,
        0x0e968, 0x0d520, 0x0daa0, 0x16aa6, 0x056d0, 0x04ae0, 0x0a9d4, 0x0a2d0, 0x0d150, 0x0f252,
        0x0d520
    );

    // 天干
    private static $tiangan = array('甲', '乙', '丙', '丁', '戊', '己', '庚', '辛', '壬', '癸');
    
    // 地支
    private static $dizhi = array('子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥');
    
    // 生肖
    private static $shengxiao = array('鼠', '牛', '虎', '兔', '龙', '蛇', '马', '羊', '猴', '鸡', '狗', '猪');
    
    // 农历月份
    private static $lunar_month_names = array('正月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '冬月', '腊月');
    
    // 农历日期
    private static $lunar_day_names = array(
        '初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十',
        '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十',
        '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十'
    );

    /**
     * 获取农历年份的天数
     */
    private static function lunar_year_days($year)
    {
        $sum = 348;
        for ($i = 0x8000; $i > 0x8; $i >>= 1) {
            $sum += (self::$lunar_info[$year - 1900] & $i) ? 1 : 0;
        }
        return $sum + self::leap_days($year);
    }

    /**
     * 获取农历年份的闰月天数
     */
    private static function leap_days($year)
    {
        if (self::leap_month($year)) {
            return (self::$lunar_info[$year - 1900] & 0x10000) ? 30 : 29;
        }
        return 0;
    }

    /**
     * 获取农历年份的闰月月份，0表示无闰月
     */
    private static function leap_month($year)
    {
        return self::$lunar_info[$year - 1900] & 0xf;
    }

    /**
     * 获取农历某月的天数
     */
    private static function lunar_month_days($year, $month)
    {
        return (self::$lunar_info[$year - 1900] & (0x10000 >> $month)) ? 30 : 29;
    }

    /**
     * 公历转农历
     * @param int $year 公历年
     * @param int $month 公历月
     * @param int $day 公历日
     * @return array 农历信息
     */
    public static function solar_to_lunar($year, $month, $day)
    {
        if ($year < 1900 || $year > 2100) {
            return false;
        }

        // 计算从1900年1月31日到指定日期的天数
        $offset = 0;
        for ($i = 1900; $i < $year; $i++) {
            $offset += (($i % 4 == 0 && $i % 100 != 0) || $i % 400 == 0) ? 366 : 365;
        }
        
        $days_of_month = array(31, (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        for ($i = 0; $i < $month - 1; $i++) {
            $offset += $days_of_month[$i];
        }
        $offset += $day - 31;

        // 1900年农历正月初一对应公历1900年1月31日
        $lunar_year = 1900;
        $lunar_month = 1;
        $lunar_day = 1;
        $is_leap = false;

        // 减去每年的天数，确定农历年份
        $temp = self::lunar_year_days($lunar_year);
        while ($offset >= $temp) {
            $offset -= $temp;
            $lunar_year++;
            $temp = self::lunar_year_days($lunar_year);
        }

        // 确定农历月份
        $leap = self::leap_month($lunar_year);
        
        for ($lunar_month = 1; $lunar_month <= 12; $lunar_month++) {
            // 先处理正常月
            $temp = self::lunar_month_days($lunar_year, $lunar_month);
            
            if ($offset < $temp) {
                $is_leap = false;
                break;
            }
            $offset -= $temp;
            
            // 如果当前月是闰月，还要处理闰月
            if ($leap > 0 && $lunar_month == $leap) {
                $temp = self::leap_days($lunar_year);
                if ($offset < $temp) {
                    $is_leap = true;
                    break;
                }
                $offset -= $temp;
            }
        }

        $lunar_day = $offset + 1;

        // 计算干支
        $gan_index = ($year - 4) % 10;
        $zhi_index = ($year - 4) % 12;
        
        // 计算日干支
        $days_from_base = floor((mktime(0, 0, 0, $month, $day, $year) - mktime(0, 0, 0, 2, 9, 1900)) / 86400);
        $day_gan_index = ($days_from_base + 5) % 10;
        $day_zhi_index = ($days_from_base + 7) % 12;

        return array(
            'lunar_year' => $lunar_year,
            'lunar_month' => $lunar_month,
            'lunar_day' => $lunar_day,
            'lunar_month_name' => ($is_leap ? '闰' : '') . self::$lunar_month_names[$lunar_month - 1],
            'lunar_day_name' => self::$lunar_day_names[$lunar_day - 1],
            'year_gan_zhi' => self::$tiangan[$gan_index] . self::$dizhi[$zhi_index],
            'day_gan_zhi' => self::$tiangan[$day_gan_index] . self::$dizhi[$day_zhi_index],
            'day_gan_index' => $day_gan_index,
            'day_zhi_index' => $day_zhi_index,
            'shengxiao' => self::$shengxiao[$zhi_index],
            'is_leap' => $is_leap
        );
    }

    /**
     * 根据农历信息计算建除十二神
     */
    public static function get_jianchu($lunar_month, $day_zhi_index)
    {
        // 建除十二神
        $jianchu = array('建', '除', '满', '平', '定', '执', '破', '危', '成', '收', '开', '闭');
        
        // 月建：正月建寅(2)，二月建卯(3)...
        $month_jian_index = ($lunar_month + 1) % 12;
        
        // 计算建除神煞
        $jianchu_index = ($day_zhi_index - $month_jian_index + 12) % 12;
        
        return $jianchu[$jianchu_index];
    }
}
