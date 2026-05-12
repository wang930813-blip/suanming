<?php /* Smarty version 2.6.25, created on 2025-12-05 16:05:50
         compiled from admin/cache.index.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div class="layui-fluid" style="padding: 20px;">
	<div class="layui-card">
		<div class="layui-card-header">
			<h3 style="margin: 0;">缓存管理</h3>
		</div>
		<div class="layui-card-body">
			<form name="myform" action="?ct=cache&ac=index" method="POST" class="layui-form">
				<input type='hidden' name='tb' value='admin_log' />
				<input type='hidden' name='orderby' value='' />
				<input type='hidden' name='dosubmit' value='true' />
				
				<div class="layui-form-item">
					<label class="layui-form-label">选择目录</label>
					<div class="layui-input-block">
						<input type="checkbox" id="allChoose" lay-skin="primary" lay-filter="allChoose" title="全选/取消" />
						<hr style="margin: 10px 0;">
						<input type="checkbox" value="/data/cache" name="dirs[]" class="cache-item" lay-skin="primary" lay-filter="cacheItem" title="框架缓存" />
						<input type="checkbox" value="/templates/compile" name="dirs[]" class="cache-item" lay-skin="primary" lay-filter="cacheItem" title="模板缓存" />
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button type="submit" class="layui-btn layui-btn-normal">
							<i class="layui-icon layui-icon-ok"></i> 清除选中缓存
						</button>
						<button type="reset" class="layui-btn layui-btn-primary">
							<i class="layui-icon layui-icon-refresh"></i> 重置
						</button>
					</div>
				</div>
			</form>	
				</div>
		</div>
	</div>
</div>

<script>
layui.use('form', function(){
    var form = layui.form;
    
    // 全选/取消全选
    form.on('checkbox(allChoose)', function(data){
        var checked = data.elem.checked;
        var cacheItems = document.getElementsByClassName('cache-item');
        
        for(var i = 0; i < cacheItems.length; i++) {
            cacheItems[i].checked = checked;
        }
        
        form.render('checkbox');
    });
    
    // 监听单个复选框
    form.on('checkbox(cacheItem)', function(data){
        var cacheItems = document.getElementsByClassName('cache-item');
        var allChoose = document.getElementById('allChoose');
        var allChecked = true;
        
        for(var i = 0; i < cacheItems.length; i++) {
            if(!cacheItems[i].checked) {
                allChecked = false;
                break;
            }
        }
        
        allChoose.checked = allChecked;
        form.render('checkbox');
    });
});
</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'admin/footer.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>