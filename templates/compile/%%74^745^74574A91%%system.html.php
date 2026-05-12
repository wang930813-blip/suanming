<?php /* Smarty version 2.6.25, created on 2025-12-05 21:49:56
         compiled from admin/system.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="layui-fluid">
    
    <!-- 面包屑 -->
    <div class="layui-card">
        <div class="layui-card-body">
            <span class="layui-breadcrumb">
                <a href="/acs/?ct=index&ac=index">首页</a>
                <a><cite><?php echo $this->_tpl_vars['web_title']; ?>
</cite></a>
            </span>
        </div>
    </div>

    <!-- 系统配置表单 -->
    <div class="layui-card">
        <div class="layui-card-header">
            <i class="layui-icon layui-icon-set"></i> <?php echo $this->_tpl_vars['web_title']; ?>

        </div>
        <div class="layui-card-body">
            <form class="layui-form" action="?ct=system&ac=<?php echo $this->_tpl_vars['ac_url']; ?>
" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="even" value="saveedit" />
                
                <?php $_from = $this->_tpl_vars['sys_all']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                
                <!-- 支付方式选择 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'pay_type'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label">显示支付方式</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="sys[pay_type][1]" value="1" title="微信支付" <?php if ($this->_tpl_vars['payMethod']['wechat'] == 1): ?>checked<?php endif; ?> lay-skin="primary">
                        <input type="checkbox" name="sys[pay_type][2]" value="2" title="支付宝支付" <?php if ($this->_tpl_vars['payMethod']['alipay'] == 1): ?>checked<?php endif; ?> lay-skin="primary">
                        <input type="checkbox" name="sys[pay_type][4]" value="4" title="3方支付" <?php if ($this->_tpl_vars['payMethod']['other'] == 1): ?>checked<?php endif; ?> lay-skin="primary">
                        <input type="checkbox" name="sys[pay_type][5]" value="5" title="Paypal支付" <?php if ($this->_tpl_vars['payMethod']['paypal'] == 1): ?>checked<?php endif; ?> lay-skin="primary">
                        <input type="checkbox" name="sys[pay_type][6]" value="6" title="Stripe支付" <?php if ($this->_tpl_vars['payMethod']['stripe'] == 1): ?>checked<?php endif; ?> lay-skin="primary">
                    </div>
                </div>
                <?php endif; ?>
                
                <!-- 首页模板切换 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'mobanqh'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label">首页模板切换</label>
                    <div class="layui-input-block">
                        <select name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]">
                            <option value="5" <?php if ($this->_tpl_vars['v']['config'] == 5): ?>selected<?php endif; ?>>默认模板</option>
                        </select>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                    </div>
                </div>
                <?php endif; ?>
                
                <!-- 推广积分开关 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'tjex_on'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label">推广积分是否开启</label>
                    <div class="layui-input-block">
                        <select name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]">
                            <option value="0" <?php if ($this->_tpl_vars['v']['config'] == 0): ?>selected<?php endif; ?>>关闭</option>
                            <option value="1" <?php if ($this->_tpl_vars['v']['config'] == 1): ?>selected<?php endif; ?>>开启</option>
                        </select>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                    </div>
                </div>
                <?php endif; ?>
                
                <!-- VIP开关 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'vip_on'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label">VIP是否开启</label>
                    <div class="layui-input-block">
                        <select name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]">
                            <option value="0" <?php if ($this->_tpl_vars['v']['config'] == 0): ?>selected<?php endif; ?>>关闭</option>
                            <option value="1" <?php if ($this->_tpl_vars['v']['config'] == 1): ?>selected<?php endif; ?>>开启</option>
                        </select>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                    </div>
                </div>
                <?php endif; ?>
                
                <!-- Stripe支付配置 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'stripe_secret_key' || $this->_tpl_vars['v']['name'] == 'stripe_public_key' || $this->_tpl_vars['v']['name'] == 'stripe_webhook_secret' || $this->_tpl_vars['v']['name'] == 'stripe_currency' || $this->_tpl_vars['v']['name'] == 'stripe_mode'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label"><?php echo $this->_tpl_vars['v']['title']; ?>
</label>
                    <div class="layui-input-block">
                        <?php if ($this->_tpl_vars['v']['name'] == 'stripe_mode'): ?>
                            <select name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]">
                                <option value="test" <?php if ($this->_tpl_vars['v']['config'] == 'test'): ?>selected<?php endif; ?>>测试模式</option>
                                <option value="live" <?php if ($this->_tpl_vars['v']['config'] == 'live'): ?>selected<?php endif; ?>>正式模式</option>
                            </select>
                        <?php else: ?>
                            <input type="text" name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]" value="<?php echo $this->_tpl_vars['v']['config']; ?>
" class="layui-input" placeholder="请输入<?php echo $this->_tpl_vars['v']['title']; ?>
">
                        <?php endif; ?>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                    </div>
                </div>
                <?php endif; ?>
                
                <!-- 短信宝配置 -->
                <?php if ($this->_tpl_vars['v']['name'] == 'sms_username' || $this->_tpl_vars['v']['name'] == 'sms_password' || $this->_tpl_vars['v']['name'] == 'sms_goods_id'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label"><?php echo $this->_tpl_vars['v']['title']; ?>
</label>
                    <div class="layui-input-block">
                        <?php if ($this->_tpl_vars['v']['name'] == 'sms_password'): ?>
                            <input type="password" name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]" value="<?php echo $this->_tpl_vars['v']['config']; ?>
" class="layui-input" placeholder="请输入<?php echo $this->_tpl_vars['v']['title']; ?>
">
                        <?php else: ?>
                            <input type="text" name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]" value="<?php echo $this->_tpl_vars['v']['config']; ?>
" class="layui-input" placeholder="请输入<?php echo $this->_tpl_vars['v']['title']; ?>
">
                        <?php endif; ?>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                        <?php if ($this->_tpl_vars['v']['name'] == 'sms_username'): ?>
                        <div class="layui-form-mid layui-word-aux">
                            短信宝API用户名，请先在 <a href="https://www.smsbao.com/" target="_blank" style="color:#1890ff;">短信宝官网</a> 注册并获取
                        </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['v']['name'] == 'sms_password'): ?>
                        <div class="layui-form-mid layui-word-aux">
                            短信宝API密码（原始密码即可）
                        </div>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['v']['name'] == 'sms_goods_id'): ?>
                        <div class="layui-form-mid layui-word-aux">
                            如使用专用通道则填写，否则留空即可
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
                <?php endif; ?>
                
                <?php endforeach; endif; unset($_from); ?>
                
                <!-- 其他普通配置项 -->
                <?php $_from = $this->_tpl_vars['sys_all']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                <?php if ($this->_tpl_vars['v']['name'] != 'pay_type' && $this->_tpl_vars['v']['name'] != 'tjex_on' && $this->_tpl_vars['v']['name'] != 'vip_on' && $this->_tpl_vars['v']['name'] != 'mobanqh' && $this->_tpl_vars['v']['name'] != 'stripe_secret_key' && $this->_tpl_vars['v']['name'] != 'stripe_public_key' && $this->_tpl_vars['v']['name'] != 'stripe_webhook_secret' && $this->_tpl_vars['v']['name'] != 'stripe_currency' && $this->_tpl_vars['v']['name'] != 'stripe_mode' && $this->_tpl_vars['v']['name'] != 'sms_username' && $this->_tpl_vars['v']['name'] != 'sms_password' && $this->_tpl_vars['v']['name'] != 'sms_goods_id'): ?>
                
                                <?php if ($this->_tpl_vars['v']['name'] == 'weixintp'): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label"><?php echo $this->_tpl_vars['v']['title']; ?>
</label>
                    <div class="layui-input-block">
                        <div class="layui-input-inline" style="width: 400px;">
                            <input type="text" name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]" id="weixintp" value="<?php echo $this->_tpl_vars['v']['config']; ?>
" class="layui-input" placeholder="请输入图片地址或点击上传">
                        </div>
                        <button type="button" class="layui-btn layui-btn-normal" id="uploadQrcodeBtn">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                        <div class="layui-form-mid layui-word-aux">二维码图片路径，如：/weixin.jpg</div>
                        <div style="margin-top: 10px;">
                            <img id="qrcodePreview" src="<?php if ($this->_tpl_vars['v']['config']): ?>/ffsm<?php echo $this->_tpl_vars['v']['config']; ?>
<?php endif; ?>" style="max-width: 300px; max-height: 200px; <?php if (! $this->_tpl_vars['v']['config']): ?>display:none;<?php endif; ?>" alt="二维码预览">
                        </div>
                    </div>
                </div>
                <?php else: ?>
                <div class="layui-form-item">
                    <label class="layui-form-label"><?php echo $this->_tpl_vars['v']['title']; ?>
</label>
                    <div class="layui-input-block">
                        <input type="text" name="sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][0]" value="<?php echo $this->_tpl_vars['v']['config']; ?>
" class="layui-input" placeholder="请输入<?php echo $this->_tpl_vars['v']['title']; ?>
">
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][1]' value='<?php echo $this->_tpl_vars['v']['title']; ?>
' />
                        <input type='hidden' name='sys[<?php echo $this->_tpl_vars['v']['name']; ?>
][2]' value='<?php echo $this->_tpl_vars['v']['class']; ?>
' />
                    </div>
                </div>
                <?php endif; ?>
                
                <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?>
                
                <!-- 提交按钮 -->
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type='hidden' name='dosubmit' value='true'/>
                        <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="formSubmit">
                            <i class="layui-icon layui-icon-ok"></i> 保存设置
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

<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
layui.use(['form', 'layer'], function(){
    var form = layui.form;
    var layer = layui.layer;
    
    // 表单渲染
    form.render();
});

// 二维码图片上传功能
$(document).ready(function(){
    // 创建隐藏的file input
    var fileInput = $('<input type="file" accept="image/*" style="display:none;" id="hiddenQrcodeInput">');
    $('body').append(fileInput);
    
    // 点击上传按钮
    $('#uploadQrcodeBtn').on('click', function(e){
        e.preventDefault();
        fileInput.click();
    });
    
    // 文件选择后处理
    fileInput.on('change', function(e){
        var file = e.target.files[0];
        if (!file) return;
        
        // 验证文件类型
        if (!file.type.match('image.*')) {
            alert('请选择图片文件');
            return;
        }
        
        // 验证文件大小（5MB）
        if (file.size > 5 * 1024 * 1024) {
            alert('图片不能超过5MB，请压缩后上传');
            return;
        }
        
        // 读取文件为Base64
        var reader = new FileReader();
        reader.onload = function(event){
            var base64Data = event.target.result;
            
            // 发送到服务器
            $.ajax({
                url: '/acs/?ct=upload&ac=base64',
                type: 'POST',
                data: { imageData: base64Data },
                dataType: 'json',
                success: function(res){
                    if (res.error_code == 0) {
                        var imagePath = '/static/upload/' + res.data;
                        $('#weixintp').val(imagePath);
                        $('#qrcodePreview').attr('src', '/ffsm' + imagePath).show();
                        alert('上传成功');
                    } else {
                        alert(res.error_message || '上传失败');
                    }
                },
                error: function(xhr, status, error){
                    alert('上传请求失败');
                }
            });
        };
        
        reader.onerror = function(){
            alert('文件读取失败');
        };
        
        reader.readAsDataURL(file);
        
        // 清空input，允许重复选择同一文件
        fileInput.val('');
    });
    
    // 输入框变化时更新预览
    $('#weixintp').on('input', function(){
        var imgPath = $(this).val();
        if(imgPath){
            var previewPath = imgPath;
            // 如果路径不是以http开头，添加/ffsm前缀
            if (imgPath && !imgPath.match(/^https?:\/\//)) {
                previewPath = '/ffsm' + imgPath;
            }
            $('#qrcodePreview').attr('src', previewPath).show();
        } else {
            $('#qrcodePreview').hide();
        }
    });
    
    // 页面加载时触发一次input事件，初始化预览
    $('#weixintp').trigger('input');
});
</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'admin/footer.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>