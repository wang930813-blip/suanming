<?php /* Smarty version 2.6.25, created on 2025-12-05 16:12:31
         compiled from admin/shop.goods_form.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'admin/shop.goods_form.html', 80, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">
            <strong><?php if ($this->_tpl_vars['goods']): ?>编辑商品<?php else: ?>添加商品<?php endif; ?></strong>
        </div>
        <div class="layui-card-body">
            <form class="layui-form" action="/acs/?ct=shop_admin&ac=goods_add&action=save" method="post">
                <?php if ($this->_tpl_vars['goods']): ?>
                <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['goods']['id']; ?>
">
                <?php endif; ?>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="goods_name" value="<?php echo $this->_tpl_vars['goods']['goods_name']; ?>
" required lay-verify="required" placeholder="请输入商品名称" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品分类</label>
                    <div class="layui-input-block">
                        <select name="cid" lay-verify="required">
                            <option value="">请选择分类</option>
                            <?php if ($this->_tpl_vars['category_list']): ?>
                            <?php $_from = $this->_tpl_vars['category_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
                            <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
" <?php if ($this->_tpl_vars['goods']['cid'] == $this->_tpl_vars['cat']['id']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
                            <?php endforeach; endif; unset($_from); ?>
                            <?php endif; ?>
                        </select>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品类型</label>
                    <div class="layui-input-block">
                        <input type="radio" name="goods_type" value="1" title="实物商品" <?php if (! $this->_tpl_vars['goods'] || $this->_tpl_vars['goods']['goods_type'] == 1): ?>checked<?php endif; ?>>
                        <input type="radio" name="goods_type" value="2" title="虚拟商品" <?php if ($this->_tpl_vars['goods']['goods_type'] == 2): ?>checked<?php endif; ?>>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品主图</label>
                    <div class="layui-input-block">
                        <input type="text" name="thumb" id="thumb" value="<?php echo $this->_tpl_vars['goods']['thumb']; ?>
" placeholder="请上传商品主图" class="layui-input" readonly>
                        <button type="button" class="layui-btn layui-btn-primary" style="margin-top: 10px;" onclick="uploadThumb()">
                            <i class="layui-icon layui-icon-upload"></i> 选择图片
                        </button>
                        <div class="layui-form-mid layui-word-aux">建议尺寸：800x800px</div>
                        <div id="thumb-preview" style="margin-top: 10px;">
                            <?php if ($this->_tpl_vars['goods']['thumb']): ?>
                            <img src="/ffsm<?php echo $this->_tpl_vars['goods']['thumb']; ?>
" style="max-width: 200px; max-height: 200px; border: 1px solid #e6e6e6; padding: 5px;">
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">首页显示图</label>
                    <div class="layui-input-block">
                        <input type="text" name="home_image" id="home_image" value="<?php echo $this->_tpl_vars['goods']['home_image']; ?>
" placeholder="请上传首页显示图片" class="layui-input" readonly>
                        <button type="button" class="layui-btn layui-btn-warm" style="margin-top: 10px;" onclick="uploadHomeImage()">
                            <i class="layui-icon layui-icon-upload"></i> 选择首页图片
                        </button>
                        <div class="layui-form-mid layui-word-aux" style="color:#FF5722;">
                            <i class="layui-icon layui-icon-tips"></i> 建议尺寸：400x400px，用于首页特辑活动区域显示（如不上传则使用商品主图）
                        </div>
                        <div id="home-image-preview" style="margin-top: 10px;">
                            <?php if ($this->_tpl_vars['goods']['home_image']): ?>
                            <img src="/ffsm<?php echo $this->_tpl_vars['goods']['home_image']; ?>
" style="max-width: 200px; max-height: 200px; border: 1px solid #e6e6e6; padding: 5px;">
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品价格</label>
                    <div class="layui-input-inline">
                        <input type="number" name="price" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['goods']['price'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
" step="0.01" required lay-verify="required" placeholder="0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">元</div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">市场价</label>
                    <div class="layui-input-inline">
                        <input type="number" name="market_price" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['goods']['market_price'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
" step="0.01" placeholder="0.00" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">元（用于显示划线价）</div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">库存数量</label>
                    <div class="layui-input-inline">
                        <input type="number" name="stock" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['goods']['stock'])) ? $this->_run_mod_handler('default', true, $_tmp, 999) : smarty_modifier_default($_tmp, 999)); ?>
" required lay-verify="required" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">商品描述</label>
                    <div class="layui-input-block">
                        <textarea id="goods_desc" name="goods_desc" class="layui-textarea"><?php echo $this->_tpl_vars['goods']['goods_desc']; ?>
</textarea>
                        <button type="button" class="layui-btn layui-btn-normal" style="margin-top: 10px;" onclick="uploadDescImage()">
                            <i class="layui-icon layui-icon-picture"></i> 上传图片到描述
                        </button>
                        <div class="layui-form-mid layui-word-aux">点击按钮上传图片，图片会自动插入到编辑器中</div>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">排序</label>
                    <div class="layui-input-inline">
                        <input type="number" name="sort" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['goods']['sort'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">数字越小越靠前</div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">首页显示</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="is_home_show" value="1" title="显示在首页" <?php if ($this->_tpl_vars['goods']['is_home_show']): ?>checked<?php endif; ?>>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="status" value="1" title="上架" <?php if (! $this->_tpl_vars['goods'] || $this->_tpl_vars['goods']['status'] == 1): ?>checked<?php endif; ?>>
                        <input type="radio" name="status" value="0" title="下架" <?php if ($this->_tpl_vars['goods']['status'] == 0): ?>checked<?php endif; ?>>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formSubmit">保存商品</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="history.back()">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/ffsm/statics/ffsm/kmmb/layui/layui.js"></script>
<script src="/ffsm/static/js/jquery-3.4.1.min.js"></script>
<script>
var editIndex;
$(document).ready(function(){
    console.log('开始初始化编辑器');
    
    layui.use(['form', 'layer', 'layedit'], function(){
        var form = layui.form;
        var layedit = layui.layedit;
        var layer = layui.layer;
        
        console.log('layedit加载完成', layedit);
        
        // 创建编辑器（不含图片按钮，使用下方的上传按钮）
        try {
            editIndex = layedit.build('goods_desc', {
                height: 400,
                tool: ['strong', 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'link', 'unlink']
            });
            console.log('编辑器创建成功，索引:', editIndex);
            layer.msg('富文本编辑器加载成功！使用下方的上传按钮添加图片', {time: 2000});
        } catch(e) {
            console.error('编辑器创建失败:', e);
            layer.msg('编辑器加载失败: ' + e.message);
        }
        
        // 监听表单提交
        form.on('submit(formSubmit)', function(data){
            layedit.sync(editIndex);
            return true;
        });
    });
});

// 接收上传图片的回调
function receiveImage(field, imagePath) {
    console.log('receiveImage被调用:', field, imagePath);
    
    // 如果是描述图片，插入到编辑器
    if (field === 'desc_image') {
        insertImageToEditor(imagePath);
        return;
    }
    
    // 其他字段的图片
    $('#' + field).val(imagePath);
    $('#' + field + '-preview').html('<img src="/ffsm' + imagePath + '" style="max-width: 200px; max-height: 200px; border: 1px solid #e6e6e6; padding: 5px;">');
}

// 在富文本编辑器中插入图片
function insertImageToEditor(imagePath) {
    console.log('尝试插入图片到编辑器:', imagePath);
    console.log('编辑器索引:', editIndex);
    
    layui.use('layedit', function(){
        var layedit = layui.layedit;
        try {
            // 获取当前内容
            var currentContent = layedit.getContent(editIndex);
            // 追加图片HTML
            var imageHtml = '<p><img src="/ffsm' + imagePath + '" style="max-width:100%;"></p>';
            layedit.setContent(editIndex, currentContent + imageHtml);
            console.log('图片插入成功');
            layui.layer.msg('图片已插入到编辑器');
        } catch(e) {
            console.error('插入图片失败:', e);
            layui.layer.msg('插入图片失败: ' + e.message);
        }
    });
}

// 接收上传的描述图片并插入到编辑器（备用回调）
function receiveDescImage(imagePath) {
    console.log('receiveDescImage被调用:', imagePath);
    insertImageToEditor(imagePath);
}

// 上传描述图片
function uploadDescImage() {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: '上传商品描述图片',
            area: ['800px', '600px'],
            content: '?ct=upload&ac=image&field=desc_image'
        });
    });
}

// 上传商品主图
function uploadThumb() {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: '上传商品主图',
            area: ['800px', '600px'],
            content: '?ct=upload&ac=image&field=thumb'
        });
    });
}

// 上传首页显示图
function uploadHomeImage() {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: '上传首页显示图',
            area: ['800px', '600px'],
            content: '?ct=upload&ac=image&field=home_image'
        });
    });
}
</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/footer_layui.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>