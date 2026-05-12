<?php
if( !defined('CORE') ) exit('Request Error!');

//-------------------------------------------------------------
//基本常量 
//-------------------------------------------------------------
define('OPEN_DEBUG', false);
define('PATH_MODEL', './model');
define('PATH_CONTROL', './control');
define('PATH_ROOT', substr(CORE, 0, -5) );
define('PATH_LIBRARY', CORE . '/library');
define('PATH_SHARE', CORE . '/share');
define('PATH_CONFIG', PATH_ROOT . '/config');
define('PATH_DATA', PATH_ROOT . '/data');
define('PATH_CACHE', PATH_DATA . '/cache');
define('PATH_DM_CONFIG', PATH_CONFIG . '/dm_config');
 
//正式环境中如果要考虑二级域名问题的应该用 .xxx.com
define('COOKIE_DOMAIN', '');
define('PHP_ERROR_LOG', false);//正式线上要改为false
//主应用URL
define('URL', getenv('APP_URL') ? getenv('APP_URL') : 'https://cs.400110.cn/');


define('FILTER_KEYWORD', '115');//过滤词库  115 orther all
//缓存相关 
define("CACHE_DATA", false);  //是否启用数据缓存
define("CACHE_PAGE",false);  //是否启用文件缓存
define("SYS_STR", "@2014#&14");    //

//session类型 file || mysql || memcache
define('SESSION_TYPE', 'file');

//------------------------------------------------------------------------------------------
//配置变量，或系统定义的全局性变量，建议都用 config 开头，在路由器中默认拦截这种变量名
//------------------------------------------------------------------------------------------
 
//调试选项（指定某些IP允许开启调试，数组格式为 array('ip1', 'ip2'...)
$GLOBALS['config']['safe_client_ip'] = array( '106.75.214.171');



//网站日志配置
$GLOBALS['config']['log'] = array(
   'file_path' => PATH_DATA.'/log',
   'log_type'  => 'file', 
);

//cache配置(df_prifix建议按网站名分开,如mc_114la_ / mc_tuan_ 等)
//cache_type一般是memcache，如无可用则用file，如有条件，用memcached
$GLOBALS['config']['cache'] = array(
    'enable'  => true,
    'cache_type' => 'file',
    'cache_time' => 7200,
   'file_cachename' => PATH_CACHE.'/cfc_data',
    'df_prefix' => 'mc_df_',
    'memcache' => array(
        'time_out' => 1,
        'host' => array( 'memcache://127.0.0.1:11212' )
    )
);

//MySql配置
//slave数据库从库可以使用多个
$db_host = getenv('DB_HOST') ? getenv('DB_HOST') : '127.0.0.1';
$db_port = getenv('DB_PORT') ? getenv('DB_PORT') : '3366';
$db_address = $db_host . ':' . $db_port;
$GLOBALS['config']['db'] = array( 
        'host'    => array(
                        'master'  => $db_address,
                        'slave' => array($db_address)
                     ),
        'user'    => getenv('DB_USER') ? getenv('DB_USER') : 'root',
        'pass'    => getenv('DB_PASS') ? getenv('DB_PASS') : 'su3DlCqLP8',
        'name'    => getenv('DB_NAME') ? getenv('DB_NAME') : '565656sql',
        'charset' => 'utf8mb4',
);

//session
$GLOBALS['config']['session'] = array(
   'live_time' => 86400,
);

//默认时区
$GLOBALS['config']['timezone_set'] = 'Asia/Shanghai';

// url重写是否开启(本版仅在<{rewrite}><{/rewriet}>中使用rewrite替换有效)
// 此项需要修改 PATH_DATA/rewrite.ini
$GLOBALS['config']['use_rewrite'] = false;

//指示替换网址是在编译前还是输出前，0--前者性能好，1--后者替换更彻底(此项本版没意义)
$GLOBALS['config']['rewrite_rptype'] = 0;

//cookie加密码
$GLOBALS['config']['cookie_pwd'] = '&uop_Ysd@erw!tr';

//默认上传目录
$GLOBALS['config']['upload_dir'] = '/static/uploads';

//图片服务器域名（用于前端显示图片）
//优先从后台系统配置读取（/acs/?ct=system&ac=index 中的 frontend_url）
//这里只是备用值，如果数据库没有配置frontend_url，则使用此值
//留空则自动使用当前访问的域名
$GLOBALS['config']['backend_url'] = '';

//微博API APPKEY
$GLOBALS['config']['WB_AKEY'] = '870395067';
//微博API SECRETKEY
$GLOBALS['config']['WB_SKEY'] = '812a53e60e65201d4811a7d5bd07643a';
//微博API 登录回调URL
//$GLOBALS['config']['WB_CALLBACK_LOGINURL'] = 'http://gaoxiao.114la.com/admin30a7169208fb13d8972c/index.php?ct=weibo&ac=index';
