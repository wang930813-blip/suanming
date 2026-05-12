<{include file='admin/header.tpl'}>

<script type="text/javascript">
    function ajaxSelectChange(id,tag,url){
        if(id<1)return false;
        var currentValue = $('.'+tag).attr('currentValue');
        $.post(
                url,
                {id:id,currentValue:currentValue},
                function(data){
                    if(data.str=='success'){
                        $('.'+tag).html(data.data);
                        layui.form.render('select');
                    }else{
                        alert(data.str);
                    }
                },
                'json'
        );
    }
</script>

<div class="layui-fluid">
    
    <!-- 面包屑 -->
    <div class="layui-card">
        <div class="layui-card-body">
            <span class="layui-breadcrumb">
                <a href="/acs/?ct=index&ac=index">首页</a>
                <a href="?ct=<{$ct}>&ac=index"><{$web_title}></a>
                <a><cite>编辑</cite></a>
            </span>
        </div>
    </div>

    <!-- 编辑表单 -->
    <div class="layui-card">
        <div class="layui-card-header"><i class="layui-icon layui-icon-edit"></i> 编辑信息</div>
        <div class="layui-card-body">
            <form class="layui-form" action="?ct=<{$ct}>&ac=edit" method="POST" enctype="multipart/form-data" lay-filter="editForm">
                <input type="hidden" name="<{$_dbfield.mainKey}>" value="<{$data[$_dbfield.mainKey]}>">

                <{foreach from=$_dbfield.editTableField item=field}>

                <{* 特殊处理images字段，添加上传按钮 *}>
                <{if $field=='images'}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <div class="layui-input-inline" style="width: 400px;">
                            <input type='text' name='images' id='images' value='<{$data.images}>' placeholder="请输入图片地址或点击上传" class="layui-input" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> />
                        </div>
                        <button type="button" class="layui-btn layui-btn-normal" id="uploadBtn">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                        <div class="layui-form-mid layui-word-aux">图片URL，如：/dashi/picture/01.png</div>
                        <div style="margin-top: 10px;">
                            <img id="imagePreview" src="<{if $data.images}>/ffsm<{$data.images}><{/if}>" style="max-width: 300px; max-height: 200px; <{if !$data.images}>display:none;<{/if}>" alt="图片预览">
                        </div>
                    </div>
                </div>

                <{elseif $_dbfield[$field].element.e_name=='input' && $_dbfield[$field].element.e_type}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <input type='<{$_dbfield[$field].element.e_type}>' name='<{$field}>' value='<{$data[$field]}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-input" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                        
                        <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && $_dbfield[$field].element.src!='' && $data[$field]!=''}>
                        <div style="margin-top:10px;">
                            <img src="<{$_dbfield[$field].element.src}><{$data[$field]}>" style="max-width:200px;max-height:150px;border:1px solid #e6e6e6;padding:5px;" />
                        </div>
                        <{/if}>
                    </div>
                </div>

                <{elseif $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <select name="<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.js.onchange) && !empty($_dbfield[$field].element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$_dbfield[$field].element.js.onchange.class}>','<{$_dbfield[$field].element.js.onchange.url}>')"<{/if}> <{if isset($_dbfield[$field].element.js.ajax) && !empty($_dbfield[$field].element.js.ajax)}>class="<{$_dbfield[$field].element.js.ajax.class}>"<{/if}> currentValue="<{$data[$field]}>">
                            <option value="">请选择<{$_dbfield.allTableField[$field]}></option>
                            <{if !isset($_dbfield[$field].element.js.ajax) || empty($_dbfield[$field].element.js.ajax)}>
                                <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                <{if is_array($vv)}>
                                    <option value="<{$vv.id}>" <{if $data[$field]==$vv.id}>selected<{/if}>><{$vv.name}></option>
                                <{else}>
                                    <option value="<{$kk}>" <{if $data[$field]==$kk}>selected<{/if}>><{$vv}></option>
                                <{/if}>
                                <{/foreach}>
                            <{/if}>
                        </select>
                    </div>
                </div>

                <{elseif $_dbfield[$field].element.e_name=='textarea'}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <textarea name='<{$field}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-textarea" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}>><{$data[$field]}></textarea>
                    </div>
                </div>

                <{else}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <input type='<{if $_dbfield[$field].element.e_type}><{$_dbfield[$field].element.e_type}><{else}>text<{/if}>' name='<{$field}>' value='<{$data[$field]}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-input" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='update') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                        
                        <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $data[$field]!=''}>
                        <div style="margin-top:10px;">
                            <img src="<{$_dbfield[$field].element.src}><{$data[$field]}>" style="max-width:200px;max-height:150px;border:1px solid #e6e6e6;padding:5px;" />
                        </div>
                        <{/if}>
                    </div>
                </div>
                <{/if}>
                
                <{/foreach}>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type='hidden' name='dosubmit' value='true' />
                        <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="formSubmit">
                            <i class="layui-icon layui-icon-ok"></i> 保存修改
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">
                            <i class="layui-icon layui-icon-refresh"></i> 重置
                        </button>
                        <a href="?ct=<{$ct}>&ac=index" class="layui-btn layui-btn-primary">
                            <i class="layui-icon layui-icon-return"></i> 返回列表
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
// 页面加载完成后执行
$(document).ready(function(){
    console.log('页面加载完成');
    
    // 图片上传功能
    console.log('初始化上传功能...');
    
    // 检查按钮是否存在
    var uploadBtn = $('#uploadBtn');
    console.log('找到的上传按钮数量:', uploadBtn.length);
    
    if (uploadBtn.length === 0) {
        console.error('找不到上传按钮#uploadBtn');
        return;
    }
    
    // 创建隐藏的file input
    var fileInput = $('<input type="file" accept="image/*" style="display:none;" id="hiddenFileInput">');
    $('body').append(fileInput);
    console.log('创建了文件输入框');
    
    // 点击上传按钮
    uploadBtn.click(function(e){
        e.preventDefault();
        console.log('上传按钮被点击！');
        $('#hiddenFileInput')[0].click();
        return false;
    });
    
    // 文件选择后处理
    fileInput.on('change', function(e){
        console.log('文件被选择');
        var file = e.target.files[0];
        if (!file) {
            console.log('没有选择文件');
            return;
        }
        
        console.log('选择的文件:', file.name, file.size);
        
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
        
        console.log('开始上传...');
        
        // 读取文件为Base64
        var reader = new FileReader();
        reader.onload = function(event){
            var base64Data = event.target.result;
            console.log('文件读取完成，开始上传到服务器');
            
            // 发送到服务器
            $.ajax({
                url: '/acs/?ct=upload&ac=base64',
                type: 'POST',
                data: { imageData: base64Data },
                dataType: 'json',
                success: function(res){
                    console.log('上传响应:', res);
                    if (res.error_code == 0) {
                        var imagePath = '/static/upload/' + res.data;
                        $('#images').val(imagePath);
                        $('#imagePreview').attr('src', '/ffsm' + imagePath).show();
                        alert('上传成功');
                    } else {
                        alert(res.error_message || '上传失败');
                    }
                },
                error: function(xhr, status, error){
                    console.error('上传失败:', status, error);
                    alert('上传请求失败');
                }
            });
        };
        
        reader.onerror = function(){
            console.error('文件读取失败');
            alert('文件读取失败');
        };
        
        reader.readAsDataURL(file);
        
        // 清空input，允许重复选择同一文件
        fileInput.val('');
    });
    
    // 输入框变化时更新预览
    $('#images').on('input', function(){
        var imgPath = $(this).val();
        if(imgPath){
            var previewPath = imgPath;
            // 如果路径不是以http开头，添加/ffsm前缀
            if (imgPath && !imgPath.match(/^https?:\/\//)) {
                previewPath = '/ffsm' + imgPath;
            }
            $('#imagePreview').attr('src', previewPath).show();
        } else {
            $('#imagePreview').hide();
        }
    });
    
    // 页面加载时触发一次input事件，初始化预览
    $('#images').trigger('input');
});
</script>

<{include file='admin/footer.tpl'}>
