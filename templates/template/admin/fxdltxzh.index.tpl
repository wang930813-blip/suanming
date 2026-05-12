<{include file="admin/header.html"}>
<div class="layui-fluid" style="padding: 20px;">
	<div class="layui-card">
		<div class="layui-card-header">
			<!-- 搜索表单 -->
			<form method="GET" action="?" style="display: flex; flex-wrap: wrap; gap: 10px; align-items: center;">
                        <input type="hidden" value="<{$ct}>" name="ct">
                        <input type="hidden" value="<{$ac}>" name="ac">
            
                        <?php $boolSearchMust = false;?>
                        <{foreach from=$_dbfield key=k item=v}>
            
                        <{if isset($v.search) && $v.search==1}>
                        <{if $v.element.e_name=='input' && !empty($v.element.e_type)}>
                        &nbsp;&nbsp;&nbsp;
                        <label><{$_dbfield.allTableField[$k]}>：</label>
                        <input type="<{$v.element.e_type}>" id="search_<{$k}>" name="<{$k}>" value="<?php echo $this->_tpl_vars['search'.$this->_tpl_vars['k']] ?>" class="text m" <{if isset($v.element.jstype) && $v.element.jstype!=''}>jstype="<{$v.element.jstype}>"<{/if}>>
                        <?php $boolSearchMust = true;?>
            
                        <{elseif $v.element.e_name=='select' && !empty($v.element.datafrom)}>
                        <{if !isset($v.element.js) || empty($v.element.js)}>
                                    <div class="w-200 mw-200px me-3">
                                        <select name="<{$k}>" id="search_<{$k}>" class="form-select" data-control="select2"  data-hide-search="true"  data-placeholder=
                                            <option value="" >所属<{$_dbfield.allTableField[$k]}></option>
                                            <{foreach from=$v.element.datafrom key=kk item=vv}>
                                            <{if is_array($vv)}>
                                        <option value="<{$vv.id}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['vv']['id'])echo 'selected';?> ><{$vv.name}></option>
                                            <{else}>
                                        <option value="<{$kk}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['kk'])echo 'selected';?> ><{$vv}></option>
                                            <{/if}>
                                            <{/foreach}>
                                        </select>
                                    </div>
                        <{else}>
            
                                &nbsp;&nbsp;&nbsp;
                                <label>所属<{$_dbfield.allTableField[$k]}>：</label>
                                <select name="<{$k}>" id="search_<{$k}>" style="height:23px;" <{if !empty($v.element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$v.element.js.onchange.class}>','<{$v.element.js.onchange.url}>')"<{/if}>  <{if !empty($v.element.js.ajax)}>class="<{$v.element.js.ajax.class}>"<{/if}> >
                                    <option value="" >所属<{$_dbfield.allTableField[$k]}></option>
                        <{if !isset($v.element.js.ajax) || empty($v.element.js.ajax)}>
                                    <{foreach from=$v.element.datafrom key=kk item=vv}>
                                    <{if is_array($vv)}>
                                <option value="<{$vv.id}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['vv']['id'])echo 'selected';?> ><{$vv.name}></option>
                                    <{else}>
                                <option value="<{$kk}>" <?php if($this->_tpl_vars['search'.$this->_tpl_vars['k']]==$this->_tpl_vars['kk'])echo 'selected';?> ><{$vv}></option>
                                    <{/if}>
                                    <{/foreach}>
                        <{/if}>
                                </select>
            
                        <{/if}>
            
            
                        <?php $boolSearchMust = true;?>
                        <{/if}>
            
                        <{/if}>
            
            
                        <{/foreach}>
                        <?php if($boolSearchMust){ ?>
                        <button type="submit" class="layui-btn layui-btn-normal">
                            <i class="layui-icon layui-icon-search"></i> 搜索
                        </button>
                        <?php } ?>
            
                    </form>
				</div>
		
		<!-- 操作按钮区域 -->
		<div class="layui-card-header" style="border-top: 1px solid #f0f0f0; padding: 15px;">
			<{if isset($_allowAction.add) && !empty($_allowAction.add)}>
			<{if $_allowAction.add.type=='dialog'}>
				<button type="button" class="layui-btn layui-btn-normal" onclick="openAdd()">
					<i class="layui-icon layui-icon-add-circle"></i> <{if $_allowAction.add.title!=''}><{$_allowAction.add.title}><{else}>我要提现<{/if}>
				</button>
			<{else}>
				<a href="?ct=<{$ct}>&amp;ac=add" class="layui-btn layui-btn-normal">
					<i class="layui-icon layui-icon-add-circle"></i> <{if $_allowAction.add.title!=''}><{$_allowAction.add.title}><{else}>新增<{/if}>
				</a>
			<{/if}>
			<{/if}>
		</div>
		<div class="layui-card-body">
			<form id="form_list" name="form_list" method="POST" action="?ct=<{$ct}>&amp;ac=batch_update">
				<input type="hidden" id="do_action" name="do_action" value="" />
				<table class="layui-table" lay-skin="line">
					<thead>
					<tr>
						<th width="50"><input type="checkbox" id="allChoose" onclick="toggleAll(this)"></th>
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
 			<{if $uid_dkqx==1}>
                <th>管理</th>
   			<{/if}>
            </tr>
            <{if !empty($data_list)}>
                <{foreach key=key item=v from=$data_list}>
				<tr>
					<td><input type="checkbox" class="item-checkbox" onclick="checkAllSelected()" value="<{$v[$_dbfield.mainKey]}>" name="ids[<{$v[$_dbfield.mainKey]}>]"></td>
                    <{*指定了列表字段*}>
                    <{if $_dbfield.listTableField}>
                        <{foreach from=$_dbfield.listTableField key=intk item=field}>
                        <td>

                            <{if $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                                <{if !isset($_dbfield.batchUpdateTableField) || !in_array($field,$_dbfield.batchUpdateTableField)}>
                                    <{*<{assign var='selectkey' value=$v[$field]}>
                                    <{assign var='selectvalue' value=$_dbfield[$field].element.datafrom}>
                                    <{if $selectvalue[$selectkey]}>
                                        <{$v[$field]}>(<{$selectvalue[$selectkey]}>)
                                    <{else}>
                                        <{$v[$field]}>
                                    <{/if}>*}>
                                    <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                        <{if is_array($vv)}>
                                            <{if $v[$field]==$vv.id}><{$vv.name}><{/if}>
                                        <{else}>
                                            <{if $v[$field]==$kk}><{$vv}><{/if}>
                                        <{/if}>
                                    <{/foreach}>
                                <{elseif isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                    <select name="<{$field}>[<{$v[$_dbfield.mainKey]}>]">
                                        <option value="" >所属<{$_dbfield.allTableField[$field]}></option>
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
                                    <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{if $field=='add_time'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$v[$field]}><{/if}>"  class="text <{if !empty($_dbfield[$field].element.class)}><{$_dbfield[$field].element.class}><{else}>s<{/if}>" <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                                <{else}>
                                    <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                        <img title="<{$v[$field]}>" alt="<{$v[$field]}>" src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="width:80px;height:60px;" />
                                    <{else}>
                                        <{if $field=='add_time'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$v[$field]}><{/if}>
                                    <{/if}>
                                <{/if}>


                            <{/if}>
                        </td>
                        <{/foreach}>
                    <{*没有指定列表字段*}>
                    <{else}>

                        <{foreach from=$_dbfield.allTableField key=field item=fieldName}>
                        <td>

                            <{if $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
                                <{if !isset($_dbfield.batchUpdateTableField) || !in_array($field,$_dbfield.batchUpdateTableField)}>
                                    <{*<{assign var='selectkey' value=$v[$field]}>
                                    <{assign var='selectvalue' value=$_dbfield[$field].element.datafrom}>
                                    <{if $selectvalue[$selectkey]}>
                                        <{$v[$field]}>(<{$selectvalue[$selectkey]}>)
                                    <{else}>
                                        <{$v[$field]}>
                                    <{/if}>*}>
                                    <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                                        <{if is_array($vv)}>
                                            <{if $v[$field]==$vv.id}><{$vv.name}>(<{$v[$field]}>)<{/if}>
                                        <{else}>
                                            <{if $v[$field]==$kk}><{$vv}>(<{$v[$field]}>)<{/if}>
                                        <{/if}>
                                    <{/foreach}>
                                <{elseif isset($_dbfield.batchUpdateTableField) && in_array($field,$_dbfield.batchUpdateTableField)}>
                                    <select name="<{$field}>[<{$v[$_dbfield.mainKey]}>]">
                                        <option value="" >所属<{$_dbfield.allTableField[$field]}></option>
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
                                    <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{$v[$field]}>"  class="text <{if !empty($_dbfield[$field].element.class)}><{$_dbfield[$field].element.class}><{else}>s<{/if}>" <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                                <{else}>
                                    <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                        <img title="<{$v[$field]}>" alt="<{$v[$field]}>" src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="width:100px;height:80px;" />
                                    <{else}>
                                        <{$v[$field]}>
                                    <{/if}>

                                <{/if}>


                            <{/if}>
                        </td>
                        <{/foreach}>

                    <{/if}>
					<{if $uid_dkqx==1}>
					<td style="white-space: nowrap;">
						<{if isset($_dbfield.editTableField) && !empty($_dbfield.editTableField)}>
						<{if isset($_allowAction.edit) && !empty($_allowAction.edit)}>
							<button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="editItem('<{$v[$_dbfield.mainKey]}>')">
								<i class="layui-icon layui-icon-edit"></i> <{if $_allowAction.edit.title!=''}><{$_allowAction.edit.title}><{else}>修改<{/if}>
							</button>
						<{/if}>
						<{/if}>

						<{if isset($_allowAction._extend) && !empty($_allowAction._extend)}>
						<{foreach from=$_allowAction._extend item=vext key=url}>
						<{if $vext.type=='dialog'}>
							<button type="button" class="layui-btn layui-btn-xs layui-btn-warm" onclick="openExtend('<{$vext.title}>','<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>')">
								<{if $vext.title!=''}><{$vext.title}><{else}>操作<{/if}>
							</button>
						<{else}>
							<a href='<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>' class="layui-btn layui-btn-xs">
								<{if $vext.title!=''}><{$vext.title}><{else}>操作<{/if}>
							</a>
						<{/if}>
						<{/foreach}>
						<{/if}>
					</td>
					<{/if}>
                </tr>
                <{/foreach}>
				<{else}>
				<tr>
					<td colspan="20" style="text-align: center; padding: 30px; color: #999;">暂无数据</td>
				</tr>
				<{/if}>
				</tbody>
				</table>
			</form>
			
			<!-- 分页 -->
			<div style="margin-top: 20px; text-align: center;">
				<{$pages}>
			</div>
		</div>
	</div>
</div>


<{include file='admin/footer.html'}>

<script>

// 全选/取消全选
function toggleAll(source) {
    var checkboxes = document.getElementsByClassName('item-checkbox');
    for(var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
}

// 检查是否全部选中
function checkAllSelected() {
    var checkboxes = document.getElementsByClassName('item-checkbox');
    var allChoose = document.getElementById('allChoose');
    var allChecked = true;
    for(var i = 0; i < checkboxes.length; i++) {
        if(!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }
    allChoose.checked = allChecked;
}

// 打开新增弹窗
function openAdd() {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: '<{if isset($_allowAction.add.title) && $_allowAction.add.title!=""}>我要提现<{else}>新增<{/if}>',
            shade: 0.3,
            maxmin: true,
            area: ['800px', '90%'],
            content: '?ct=<{$ct}>&ac=add',
            end: function(){
                location.reload();
            }
        });
    });
}

// 打开编辑弹窗
function editItem(id) {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: '<{if isset($_allowAction.edit.title) && $_allowAction.edit.title!=""}>打款<{else}>编辑<{/if}>',
            shade: 0.3,
            maxmin: true,
            area: ['800px', '90%'],
            content: '?ct=<{$ct}>&ac=edit&id=' + id + '&page_no=<{$current_page}>',
            end: function(){
                location.reload();
            }
        });
    });
}

// 打开扩展操作弹窗
function openExtend(title, url) {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.open({
            type: 2,
            title: title,
            shade: 0.3,
            maxmin: true,
            area: ['800px', '90%'],
            content: url,
            end: function(){
                location.reload();
            }
        });
    });
}


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

function more_delete(id,url) {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.confirm('确定要删除选中的项吗？', {
            icon: 3,
            title: '删除确认',
            btn: ['确定删除', '取消']
        }, function(index){
            document.getElementById('do_action').value=id;
            document.form_list.action = url;
            document.form_list.submit();
            layer.close(index);
        });
    });
}

    function ajaxSelectChange(id,tag,url){
        if(id<1)return false;
        $.post(
           url,
           {id:id},
           function(data){
               if(data.str=='success'){
                   //$('.'+tag).append(data.data);
                   $('.'+tag).html(data.data);
               }else{
                   alert(data.str);
               }
           },
           'json'
        );
    }

</script>