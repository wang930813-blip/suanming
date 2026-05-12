<?php
if (!defined('CORE')) exit('Request Error!');
/**
 * 多语言引擎实现类
 */
class Lang
{
    // 设置默认语言和语言目录
    protected static $defaultLanguage = 'zh';
    protected static $languagesDir = 'languages';
    protected static $userLanguage = 'zh';
    protected static $userLanguage_desc = 'chinese_simplified';
    protected static $LanguageArr = [];

    public static function init()
    {
        session_start();
        $_language = $_COOKIE['_language'];
        if (!isset($_language)) {
            //require CORE . '/ip_address.php';
            $ip_address = new ip_address();
            $ip    = $ip_address->GetIP();
            $addr  = $ip_address->ip2addr($ip);
            if ($addr['city'] == '英国') {
                setcookie('_language', 'en');
                $_language = 'en';
            } else if ($addr['city'] == '西班牙') {
                setcookie('_language', 'spa');
                $_language = 'spa';
            } else if ($addr['city'] == '阿联酋') {
                setcookie('_language', 'ara');
                $_language = 'ara';
            } else if ($addr['city'] == '法国') {
                setcookie('_language', 'fra');
                $_language = 'fra';
            } else {
                setcookie('_language', 'zh');
                $_language = 'zh';
            }
        }
        if ($_language) {
            switch ($_language) {
                case 'zh':
                    self::$userLanguage = 'zh';
                    self::$userLanguage_desc = 'chinese_simplified';
                    break;
                case 'en':
                    self::$userLanguage = 'en';
                    self::$userLanguage_desc = 'english';
                    break;
                case 'spa':
                    self::$userLanguage = 'spa';
                    self::$userLanguage_desc = 'spanish';
                    break;
                case 'ara':
                    self::$userLanguage = 'ara';
                    self::$userLanguage_desc = 'arabic';
                    break;
                case 'fra':
                    self::$userLanguage = 'fra';
                    self::$userLanguage_desc = 'french';
                    break;
            }
        }
    }
    public static function translate($html = '')
    {
        self::init();
        // 加载语言文件
        $languageData = file_get_contents(CORE . '/languages/' . self::$userLanguage . '.json');
        $languageArr = json_decode($languageData, true);
        $languageData_zh = file_get_contents(CORE . '/languages/zh.json');
        $languageArr_zh = json_decode($languageData_zh, true);

        //$pattern = '/<[^>]+>(.*?)<\/[^>]+>/u';
        $preg = "/<[^>]+>[\x{4e00}-\x{9fa5}\d\w\，\,\。\|\!\！\ \?\？\/\…\：]+<\/[^>]+>/u";
        preg_match_all('/<title>(.*?)<\/title>/is', $html, $matches_title);
        preg_match_all('/<lang>(.*?)<\/lang>/is', $html, $matches_lang);
        preg_match_all('/<(.*?) lang>(.*?)<\/[^>]+>/', $html, $matches_lang_tag);
        preg_match_all($preg, $html, $matches_div);
        preg_match_all("/placeholder=\"(.*?)\"/", $html, $matches_placeholder);
        $listArr = array_merge($matches_title[0], $matches_lang[0], $matches_lang_tag[0], $matches_div[0], $matches_placeholder[0]);
        //print_r($listArr);
        foreach ($listArr as $value) {
            $textArr[] =  $text = preg_replace('/<[^>]+>(.*?)<\/[^>]+>/u', '$1', $value);
            $languageKey = array_search($text, $languageArr_zh);
            $tag1 = preg_replace('/<(.*?)>(.*?)<(.*?)>/u', '<$1>', $value);
            $tag2 = preg_replace('/<(.*?)>(.*?)<\/(.*?)>/u', '</$3>', $value);

            if (strpos($value, "<lang>") !== false) {
                if ($languageKey) {
                    $replace = '<lang>' . $languageArr[$languageKey] . '</lang>';
                    $html = str_replace($value, $replace, $html);
                }
            }
            if (strpos($value, "<title>") !== false) {
                $zhanming = $GLOBALS['config']['money']['zhanming'];
                $title_text = preg_replace('/<title>(.*?)-' . $zhanming . '<\/title>/', '$1', $value);
                $title_key = array_search($title_text, $languageArr_zh);
                if ($title_key) {
                    $_replace = '<title>' . $languageArr[$title_key] . '</title>';
                    $html = str_replace($value, $_replace, $html);
                }
            }
            if (strpos($value, 'placeholder') !== false) {
                $placeholder_text = preg_replace('/placeholder=\"(.*?)\"/', '$1', $value);
                $placeholder_key = array_search($placeholder_text, $languageArr_zh);
                if ($placeholder_key) {
                    $replace = 'placeholder="' . $languageArr[$placeholder_key] . '"';
                    $html = str_replace($value, $replace, $html);
                }
                //  $html = str_replace($value, $replace, $html);
            }
            if ($languageKey) {
                $replace = $tag1 . $languageArr[$languageKey] . $tag2;
                $html = str_replace($value, $replace, $html);
            }
        }

        $textArrNew = array_unique($textArr);
        $inexistence = [];
        foreach ($textArrNew as $key => $value) {
            $textArrNew_keys = array_search($value, $languageArr_zh);
            if (!$textArrNew_keys) {
                $inexistence[] = $value;
            }
        }

        // 替换剩余中文
        preg_match_all("/[\x{3000}-\x{303F}\x{FF00}-\x{FFEF}\x{4E00}-\x{9FAF}\x{20000}-\x{2A6DF}]+/u", $html, $matches_other);
        $html = self::replace_other($languageArr, $languageArr_zh, $html, $matches_other[0]);
        //print_r($matches_other);
        $matches_other_new = [];

        foreach ($matches_other[0] as $key => $value) {
            $matches_other_keys = array_search($value, $languageArr_zh);
            if (!$matches_other_keys) {
                $matches_other_new[] = $value;
            }
        }
        $matches_other_new = array_unique($matches_other_new);
        $variable = $inexistence;
        //$variable = $matches_other_new;
        $_html = '';
        foreach ($variable as $key => $value) {
            $_html .= $value . "\n";
        }
       // print_r($inexistence);
        // 替换多余lang
        $html = preg_replace('/<lang>(.*?)<\/lang>/', '$1', $html);
        return $html;
    }


    // 全文本匹配
    public static function replace_other($languageArr, $languageArr_zh, $html, $arr)
    {
        foreach ($arr as $value) {
            $languageKey = array_search($value, $languageArr_zh);
            $_value = str_replace('：', '', $value);
            if (!$languageKey && strlen($value) > 0) {
                $_value = str_replace('：', '', $value);
                $_value = trim($_value);
                $languageKey = array_search($_value, $languageArr_zh);
            }
            if ($languageKey && strlen($value) > 0) {
                $replace =   $languageArr[$languageKey];
                $html = str_replace($value, $replace, $html);
            }
        }
        return $html;
    }


    // 语言包设置
    public static function package()
    {
        self::init();
        // 加载语言文件
        $languageData = file_get_contents(CORE . '/languages/' . self::$userLanguage . '.json');

        $languageArr = json_decode($languageData, true);
        $languageArr['_changeLanguage'] = self::$userLanguage_desc;
        return $languageArr;
    }
}
