<{include file="admin/header.html"}>

<script lang='javascript'>
    function get_value(id){
        value = document.getElementById(id).value;
        if(value!=''){
            return id+'='+value;
        }else{
            return 'empty';
        }
    }

    function more_edit(id)
    {
        document.getElementById('do_action').value=id;
        document.form_list.submit();
    }

    function more_edit2(id,url)
    {
        document.getElementById('do_action').value=id;
        document.form_list.action = url;
        document.form_list.submit();
    }

    function more_delete(id,url)
    {
        if(!confirm('确定要批量删除吗？')){
            return false;
        }
        document.getElementById('do_action').value=id;
        document.form_list.action = url;
        document.form_list.submit();
    }

    function ajaxSelectChange(id,tag,url){
        if(id<1)return false;
        $.post(
           url,
           {id:id},
           function(data){
               if(data.str=='success'){
                   $('.'+tag).html(data.data);
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
                <a><cite><{$web_title}></cite></a>
            </span>
        </div>
    </div>

    <!-- 搜索表单 -->
    <?php $boolSearchMust = false;?>
    <{foreach from=$_dbfield key=k item=v}>
        <{if isset($v.search) && $v.search==1}>
            <?php $boolSearchMust = true;?>
        <{/if}>
    <{/foreach}>
    
    <?php if($boolSearchMust){ ?>
    <div class="layui-card">
        <div class="layui-card-header"><i class="layui-icon layui-icon-search"></i> 搜索筛选</div>
        <div class="layui-card-body">
            <form class="layui-form" method="GET" action="?">
                <input type="hidden" value="<{$ct}>" name="ct">
                <input type="hidden" value="<{$ac}>" name="ac">
                
                <div class="layui-form-item">
                    <{foreach from=$_dbfield key=k item=v}>
                    <{if isset($v.search) && $v.search==1}>
                        
                        <{if $v.element.e_name=='input' && !empty($v.element.e_type)}>
                        <div class="layui-inline">
                            <label class="layui-form-label"><{$_dbfield.allTableField[$k]}></label>
                            <div class="layui-input-inline">
                                <input type="<{$v.element.e_type}>" name="<{$k}>" value="<?php echo $this->_tpl_vars['search'.$this->_tpl_vars['k']] ?>" placeholder="请输入<{$_dbfield.allTableField[$k]}>" class="layui-input" <{if isset($v.element.jstype) && $v.element.jstype!=''}>jstype="<{$v.element.jstype}>"<{/if}>>
                            </div>
                        </div>
                        
                        <{elseif $v.element.e_name=='select' && !empty($v.element.datafrom)}>
                        <div class="layui-inline">
                            <label class="layui-form-label"><{$_dbfield.allTableField[$k]}></label>
                            <div class="layui-input-inline">
                                <select name="<{$k}>" <{if !empty($v.element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$v.element.js.onchange.class}>','<{$v.element.js.onchange.url}>')"<{/if}>>
                                    <option value="">请选择</option>
                                    <{foreach from=$v.element.datafrom key=kk item=vv}>
                                    <{if is_array($vv)}>
                                        <option value="<{$vv.id}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['vv']['id'])echo 'selected';?>><{$vv.name}></option>
                                    <{else}>
                                        <option value="<{$kk}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['kk'])echo 'selected';?>><{$vv}></option>
                                    <{/if}>
                                    <{/foreach}>
                                </select>
                            </div>
                        </div>
                        <{/if}>
                        
                    <{/if}>
                    <{/foreach}>
                    
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit><i class="layui-icon layui-icon-search"></i> 搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <?php } ?>

    <!-- 数据列表 -->
    <div class="layui-card">
        <div class="layui-card-header">
            <i class="layui-icon layui-icon-list"></i> 数据列表
        </div>
        <div class="layui-card-body">
            
            <!-- 批量操作按钮 -->
            <div class="layui-btn-group" style="margin-bottom: 10px;">
                <{if isset($_allowAction.add) && !empty($_allowAction.add)}>
                    <a href="?ct=<{$ct}>&amp;ac=add" class="layui-btn layui-btn-sm layui-btn-normal">
                        <i class="layui-icon layui-icon-add-1"></i> <{if $_allowAction.add.title!=''}><{$_allowAction.add.title}><{else}>新增<{/if}>
                    </a>
                <{/if}>
                
                <{if isset($_dbfield.batchUpdateTableField) && !empty($_dbfield.batchUpdateTableField)}>
                    <button type="button" class="layui-btn layui-btn-sm" onclick="more_edit('edit');">
                        <i class="layui-icon layui-icon-edit"></i> 批量修改
                    </button>
                <{/if}>
                
                <{if isset($_dbfield.batchDeleteTableField) && !empty($_dbfield.batchDeleteTableField)}>
                    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger" onclick="more_delete('batch_delete','?ct=<{$ct}>&amp;ac=batch_delete');">
                        <i class="layui-icon layui-icon-delete"></i> 批量删除
                    </button>
                <{/if}>
            </div>

            <form id="form_list" name="form_list" method="POST" action="?ct=<{$ct}>&amp;ac=batch_update">
                <input type="hidden" id="do_action" name="do_action" value="" />
                
                <table class="layui-table" lay-skin="line">
                    <thead>
                        <tr>
                            <th width="50">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th>
                            <{*指定了列表字段*}>
                            <{if $_dbfield.listTableField}>
                                <{foreach from=$_dbfield.listTableField key=field item=v}>
                                <th><{$_dbfield.allTableField[$v]}></th>
                                <{/foreach}>
                            <{else}>
                                <{foreach from=$_dbfield.allTableField item=v}>
                                <th><{$v}></th>
                                <{/foreach}>
                            <{/if}>
                            <th width="200">管理操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <{if !empty($data_list)}>
                        <{foreach key=key item=v from=$data_list}>
                        <tr>
                            <td>
                                <input type="checkbox" name="ids[<{$v[$_dbfield.mainKey]}>]" value="<{$v[$_dbfield.mainKey]}>" lay-skin="primary">
                            </td>
                            
                            <{*指定了列表字段*}>
                            <{if $_dbfield.listTableField}>
                                <{foreach from=$_dbfield.listTableField key=intk item=field}>
                                <td>
                                    <{if $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                                        <{if !isset($_dbfield.batchUpdateTableField) || !in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                                <{if is_array($vv)}>
                                                    <{if $v[$field]==$vv.id}><{$vv.name}><{/if}>
                                                <{else}>
                                                    <{if $v[$field]==$kk}><{$vv}><{/if}>
                                                <{/if}>
                                            <{/foreach}>
                                        <{elseif isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <select name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" class="layui-input">
                                                <option value="">请选择</option>
                                                <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                                    <{if is_array($vv)}>
                                                        <option value="<{$vv.id}>" <{if $v[$field]==$vv.id}>selected<{/if}>><{$vv.name}></option>
                                                    <{else}>
                                                        <option value="<{$kk}>" <{if $v[$field]==$kk}>selected<{/if}>><{$vv}></option>
                                                    <{/if}>
                                                <{/foreach}>
                                            </select>
                                        <{/if}>
                                    <{else}>
                                        <{if isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{$v[$field]}>" class="layui-input" style="width:auto;" />
                                        <{else}>
                                            <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                                <img src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="max-width:80px;max-height:60px;" />
                                            <{else}>
                                                <{$v[$field]}>
                                            <{/if}>
                                        <{/if}>
                                    <{/if}>
                                </td>
                                <{/foreach}>
                            <{else}>
                                <{foreach from=$_dbfield.allTableField key=field item=fieldName}>
                                <td>
                                    <{if $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                                        <{if !isset($_dbfield.batchUpdateTableField) || !in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                                <{if is_array($vv)}>
                                                    <{if $v[$field]==$vv.id}><{$vv.name}><{/if}>
                                                <{else}>
                                                    <{if $v[$field]==$kk}><{$vv}><{/if}>
                                                <{/if}>
                                            <{/foreach}>
                                        <{elseif isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <select name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" class="layui-input">
                                                <option value="">请选择</option>
                                                <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                                    <{if is_array($vv)}>
                                                        <option value="<{$vv.id}>" <{if $v[$field]==$vv.id}>selected<{/if}>><{$vv.name}></option>
                                                    <{else}>
                                                        <option value="<{$kk}>" <{if $v[$field]==$kk}>selected<{/if}>><{$vv}></option>
                                                    <{/if}>
                                                <{/foreach}>
                                            </select>
                                        <{/if}>
                                    <{else}>
                                        <{if isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                            <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{$v[$field]}>" class="layui-input" style="width:auto;" />
                                        <{else}>
                                            <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                                <img src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="max-width:100px;max-height:80px;" />
                                            <{else}>
                                                <{$v[$field]}>
                                            <{/if}>
                                        <{/if}>
                                    <{/if}>
                                </td>
                                <{/foreach}>
                            <{/if}>

                            <td>
                                <{if isset($_dbfield.editTableField) && !empty($_dbfield.editTableField)}>
                                    <{if isset($_allowAction.edit) && !empty($_allowAction.edit)}>
                                        <a href="?ct=<{$ct}>&amp;ac=edit&amp;id=<{$v[$_dbfield.mainKey]}>&amp;page_no=<{$current_page}>" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon layui-icon-edit"></i> <{if $_allowAction.edit.title!=''}><{$_allowAction.edit.title}><{else}>修改<{/if}>
                                        </a>
                                    <{/if}>
                                <{/if}>

                                <{if isset($_allowAction.delete) && !empty($_allowAction.delete)}>
                                    <a class="layui-btn layui-btn-xs layui-btn-danger" href="?ct=<{$ct}>&amp;ac=delete&amp;id=<{$v[$_dbfield.mainKey]}>" onclick="return confirm('确定删除吗？');">
                                        <i class="layui-icon layui-icon-delete"></i> <{if $_allowAction.delete.title!=''}><{$_allowAction.delete.title}><{else}>删除<{/if}>
                                    </a>
                                <{/if}>

                                <{if isset($_allowAction._extend) && !empty($_allowAction._extend)}>
                                    <{foreach from=$_allowAction._extend item=vext key=url}>
                                        <a href='<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>' class="layui-btn layui-btn-xs layui-btn-warm">
                                            <{if $vext.title!=''}><{$vext.title}><{else}>操作<{/if}>
                                        </a>
                                    <{/foreach}>
                                <{/if}>
                            </td>
                        </tr>
                        <{/foreach}>
                    <{else}>
                        <tr>
                            <td colspan="100" align="center" style="padding: 30px; color: #999;">
                                <i class="layui-icon layui-icon-face-cry" style="font-size: 30px;"></i>
                                <p>暂无数据</p>
                            </td>
                        </tr>
                    <{/if}>
                    </tbody>
                </table>
            </form>
            
            <!-- 分页 -->
            <div class="layui-box layui-laypage layui-laypage-default" style="margin-top: 10px;">
                <{$pages}>
            </div>
        </div>
    </div>
</div>

<script>
layui.use(['form', 'layer'], function(){
    var form = layui.form;
    var layer = layui.layer;
    
    // 全选
    form.on('checkbox(allChoose)', function(data){
        var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
        child.each(function(index, item){
            item.checked = data.elem.checked;
        });
        form.render('checkbox');
    });
});
</script>

<{include file='admin/footer.html'}>
