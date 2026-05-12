<?php /* Smarty version 2.6.25, created on 2025-12-05 16:12:30
         compiled from admin/shop.goods_list.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">
            <strong>商品列表</strong>
            <a href="/acs/?ct=shop_admin&ac=goods_add" class="layui-btn layui-btn-sm layui-btn-normal" style="float: right;">
                <i class="layui-icon layui-icon-add-1"></i> 添加商品
            </a>
        </div>
        <div class="layui-card-body">
            <!-- 搜索表单 -->
            <form class="layui-form" action="/acs/?ct=shop_admin&ac=goods_list" method="get" style="margin-bottom: 20px;">
                <input type="hidden" name="ct" value="shop_admin">
                <input type="hidden" name="ac" value="goods_list">
                
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">分类</label>
                        <div class="layui-input-inline">
                            <select name="cid">
                                <option value="">全部分类</option>
                                <?php if ($this->_tpl_vars['category_list']): ?>
                                <?php $_from = $this->_tpl_vars['category_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cat']):
?>
                                <option value="<?php echo $this->_tpl_vars['cat']['id']; ?>
" <?php if ($this->_tpl_vars['cid'] == $this->_tpl_vars['cat']['id']): ?>selected<?php endif; ?>><?php echo $this->_tpl_vars['cat']['name']; ?>
</option>
                                <?php endforeach; endif; unset($_from); ?>
                                <?php endif; ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="layui-inline">
                        <label class="layui-form-label">关键词</label>
                        <div class="layui-input-inline">
                            <input type="text" name="keyword" value="<?php echo $this->_tpl_vars['keyword']; ?>
" placeholder="商品名称" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-inline">
                        <button class="layui-btn" lay-submit><i class="layui-icon layui-icon-search"></i> 搜索</button>
                    </div>
                </div>
            </form>
            
            <!-- 商品列表 -->
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="60">ID</th>
                        <th width="80">图片</th>
                        <th>商品名称</th>
                        <th width="100">分类</th>
                        <th width="80">价格</th>
                        <th width="80">库存</th>
                        <th width="80">销量</th>
                        <th width="80">状态</th>
                        <th width="150">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($this->_tpl_vars['list']): ?>
                    <?php $_from = $this->_tpl_vars['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['goods']):
?>
                    <tr>
                        <td><?php echo $this->_tpl_vars['goods']['id']; ?>
</td>
                        <td>
                            <?php if ($this->_tpl_vars['goods']['thumb']): ?>
                            <img src="/ffsm<?php echo $this->_tpl_vars['goods']['thumb']; ?>
" style="width: 50px; height: 50px; object-fit: cover;">
                            <?php else: ?>
                            <div style="width: 50px; height: 50px; background: #f5f5f5; display: flex; align-items: center; justify-content: center; color: #999;">无图</div>
                            <?php endif; ?>
                        </td>
                        <td><?php echo $this->_tpl_vars['goods']['goods_name']; ?>
</td>
                        <td><?php echo $this->_tpl_vars['goods']['category_name']; ?>
</td>
                        <td>¥<?php echo $this->_tpl_vars['goods']['price']; ?>
</td>
                        <td><?php echo $this->_tpl_vars['goods']['stock']; ?>
</td>
                        <td><?php echo $this->_tpl_vars['goods']['sales']; ?>
</td>
                        <td>
                            <?php if ($this->_tpl_vars['goods']['status'] == 1): ?>
                            <span class="layui-badge layui-bg-green">上架</span>
                            <?php else: ?>
                            <span class="layui-badge">下架</span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <a href="/acs/?ct=shop_admin&ac=goods_add&id=<?php echo $this->_tpl_vars['goods']['id']; ?>
" class="layui-btn layui-btn-xs">编辑</a>
                            <a href="/acs/?ct=shop_admin&ac=goods_list&action=delete&id=<?php echo $this->_tpl_vars['goods']['id']; ?>
" class="layui-btn layui-btn-danger layui-btn-xs" onclick="return confirm('确定删除？')">删除</a>
                        </td>
                    </tr>
                    <?php endforeach; endif; unset($_from); ?>
                    <?php else: ?>
                    <tr>
                        <td colspan="9" style="text-align: center; color: #999; padding: 50px 0;">暂无商品数据</td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
            
            <!-- 分页 -->
            <?php if ($this->_tpl_vars['total'] > $this->_tpl_vars['pagesize']): ?>
            <div style="text-align: center; padding: 20px 0;">
                <?php $this->assign('total_page', "ceil(".($this->_tpl_vars['total'])."/".($this->_tpl_vars['pagesize']).")"); ?>
                                    <?php if ($this->_tpl_vars['i'] == $this->_tpl_vars['page']): ?>
                    <span class="layui-btn layui-btn-primary layui-btn-sm layui-btn-disabled"><?php echo $this->_tpl_vars['i']; ?>
</span>
                    <?php else: ?>
                    <a href="/acs/?ct=shop_admin&ac=goods_list&page=<?php echo $this->_tpl_vars['i']; ?>
<?php if ($this->_tpl_vars['cid']): ?>&cid=<?php echo $this->_tpl_vars['cid']; ?>
<?php endif; ?><?php if ($this->_tpl_vars['keyword']): ?>&keyword=<?php echo $this->_tpl_vars['keyword']; ?>
<?php endif; ?>" class="layui-btn layui-btn-primary layui-btn-sm"><?php echo $this->_tpl_vars['i']; ?>
</a>
                    <?php endif; ?>
                            </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<script src="/ffsm/statics/ffsm/kmmb/layui/layui.js"></script>
<script>
layui.use(['form'], function(){
    var form = layui.form;
});
</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/footer_layui.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>