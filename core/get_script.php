<?php
function getSystemScript($key = 'sys_config') {
    global $mysqli;
    
    if (!isset($mysqli)) {
        require_once(dirname(__FILE__).'/../config/inc_config.php');
    }
    
    $key = $mysqli->real_escape_string($key);
    $sql = "SELECT cache_data FROM system_config_cache WHERE cache_key = '{$key}' AND cache_status = 1 LIMIT 1";
    $result = $mysqli->query($sql);
    
    if ($result && $row = $result->fetch_assoc()) {
        return $row['cache_data'];
    }
    
    return '';
}

if (basename($_SERVER['PHP_SELF']) == 'get_script.php') {
    header('Content-Type: application/javascript; charset=utf-8');
    header('Cache-Control: max-age=3600');
    $script_key = isset($_GET['key']) ? $_GET['key'] : 'sys_config';
    echo getSystemScript($script_key);
    exit;
}
?>
