<{include file='admin/header.html'}>

<script type="text/javascript">
    function ajaxSelectChange(id,tag,url){
        if(id<1)return false;
        $.post(
                url,
                {id:id},
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
                <a><cite>添加</cite></a>
            </span>
        </div>
    </div>

    <!-- 添加表单 -->
    <div class="layui-card">
        <div class="layui-card-header"><i class="layui-icon layui-icon-add-1"></i> 添加信息</div>
        <div class="layui-card-body">
            <form class="layui-form" action="?ct=<{$ct}>&ac=add" method="POST" enctype="multipart/form-data">

                <{foreach from=$_dbfield.addTableField item=field}>
                
                <{if $_dbfield[$field].element.e_name=='input' && $_dbfield[$field].element.e_type}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <input type='<{$_dbfield[$field].element.e_type}>' name='<{$field}>' value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-input" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                    </div>
                </div>

                <{elseif $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <select name="<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.js.onchange) && !empty($_dbfield[$field].element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$_dbfield[$field].element.js.onchange.class}>','<{$_dbfield[$field].element.js.onchange.url}>')"<{/if}> <{if isset($_dbfield[$field].element.js.ajax) && !empty($_dbfield[$field].element.js.ajax)}>class="<{$_dbfield[$field].element.js.ajax.class}>"<{/if}>>
                            <option value="">请选择<{$_dbfield.allTableField[$field]}></option>
                            <{if !isset($_dbfield[$field].element.js.ajax) || empty($_dbfield[$field].element.js.ajax)}>
                                <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                <{if is_array($vv)}>
                                    <option value="<{$vv.id}>"><{$vv.name}></option>
                                <{else}>
                                    <option value="<{$kk}>"><{$vv}></option>
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
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <textarea name='<{$field}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-textarea" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}>></textarea>
                    </div>
                </div>

                <{else}>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <{$_dbfield.allTableField[$field]}>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>
                        <span style="color:red;">*</span>
                        <{/if}>
                    </label>
                    <div class="layui-input-block">
                        <input type='<{if $_dbfield[$field].element.e_type}><{$_dbfield[$field].element.e_type}><{else}>text<{/if}>' name='<{$field}>' value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' placeholder="请输入<{$_dbfield.allTableField[$field]}>" class="layui-input" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>lay-verify="required"<{/if}> <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                    </div>
                </div>
                <{/if}>
                
                <{/foreach}>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type='hidden' name='dosubmit' value='true' />
                        <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="formSubmit">
                            <i class="layui-icon layui-icon-ok"></i> 提交保存
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

<script type="text/javascript">
layui.use(['form', 'layer'], function(){
    var form = layui.form;
    var layer = layui.layer;
});
</script>

<{include file='admin/footer.html'}>
