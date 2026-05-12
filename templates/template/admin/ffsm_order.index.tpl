<{include file="admin/header.html"}>
<div class="layui-fluid" style="padding-top: 10px;">
    
    <!-- 操作按钮区域 - 置顶显示 -->
    <div style="background: #fff; padding: 15px; border-radius: 8px; margin-bottom: 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);">
        <div style="display: flex; align-items: center; gap: 15px;">
            <{if isset($_allowAction.add) && !empty($_allowAction.add)}>
                <{if $_allowAction.add.type=='dialog'}>
                    <button class="layui-btn layui-btn-normal" type="button" onclick="add('?ct=<{$ct}>&ac=add&TB_iframe=true&width=<{$_allowAction.add.width}>&height=<{$_allowAction.add.height}>');" style="height: 38px;">
                        <i class="layui-icon layui-icon-add-circle"></i> <{if $_allowAction.add.title!=''}><{$_allowAction.add.title}><{else}>新增订单<{/if}>
                    </button>
                <{else}>
                    <a href="?ct=<{$ct}>&amp;ac=add" class="layui-btn layui-btn-normal" style="height: 38px; line-height: 38px;">
                        <i class="layui-icon layui-icon-add-circle"></i> <{if $_allowAction.add.title!=''}><{$_allowAction.add.title}><{else}>新增订单<{/if}>
                    </a>
                <{/if}>
            <{/if}>
            
            <{if isset($_dbfield.batchDeleteTableField) && !empty($_dbfield.batchDeleteTableField)}>
                <button type="button" onclick="more_delete('batch_delete','?ct=<{$ct}>&amp;ac=batch_delete');" class="layui-btn layui-btn-danger" style="height: 38px;">
                    <i class="layui-icon layui-icon-delete"></i> 批量删除
                </button>
            <{/if}>
        </div>
    </div>
	    
    <!-- 统计卡片 -->
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-form" style="font-size: 30px; color: #1E9FFF; margin-bottom: 10px;"></i>
                    <div class="stat-label">总订单数</div>
                    <div class="stat-value"><{$sum_total}></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-rmb" style="font-size: 30px; color: #FFB800; margin-bottom: 10px;"></i>
                    <div class="stat-label">订单总金额</div>
                    <div class="stat-value" style="color: #FFB800;">¥<{$money_all}></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-ok-circle" style="font-size: 30px; color: #5FB878; margin-bottom: 10px;"></i>
                    <div class="stat-label">已付费订单数</div>
                    <div class="stat-value" style="color: #5FB878;"><{$sum_cj}></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-dollar" style="font-size: 30px; color: #009688; margin-bottom: 10px;"></i>
                    <div class="stat-label">已付费金额</div>
                    <div class="stat-value" style="color: #009688;">¥<{$money_cj}></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-time" style="font-size: 30px; color: #FF5722; margin-bottom: 10px;"></i>
                    <div class="stat-label">待付费订单数</div>
                    <div class="stat-value" style="color: #FF5722;"><{$sum_wcj}></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md2">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <i class="layui-icon layui-icon-website" style="font-size: 30px; color: #FA6400; margin-bottom: 10px;"></i>
                    <div class="stat-label">待付费金额</div>
                    <div class="stat-value" style="color: #FA6400;">¥<{$money_wcj}></div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 订单列表 -->
    <div style="margin-top: 30px;">
		<div class="layui-card">
			<div class="layui-card-header" style="display: block; padding: 15px;">
				<!-- 搜索表单 -->
				<div style="margin-bottom: 15px;">
					<form method="GET" action="?" style="display: flex; flex-wrap: wrap; gap: 10px; align-items: center;">
					    
                        <?php $boolSearchMust = false;?>
                        <{foreach from=$_dbfield key=k item=v}>
            
                        <{if isset($v.search) && $v.search==1}>
                        <{if $v.element.e_name=='input' && !empty($v.element.e_type)}>
                        
                        <div class="w-200 mw-200px me-3">
                        <input type="<{$v.element.e_type}>" id="search_<{$k}>" name="<{$k}>" value="<?php echo $this->_tpl_vars['search'.$this->_tpl_vars['k']] ?>" placeholder="<{$_dbfield.allTableField[$k]}>"  class="layui-input" <{if isset($v.element.jstype) && $v.element.jstype!=''}>jstype="<{$v.element.jstype}>"<{/if}>>
                        
                        </div>
                        <?php $boolSearchMust = true;?>
            
                        <input type="hidden" value="<{$ct}>" name="ct">
                        <input type="hidden" value="<{$ac}>" name="ac">
                        
                        <{elseif $v.element.e_name=='select' && !empty($v.element.datafrom)}>
                        <{if !isset($v.element.js) || empty($v.element.js)}>
            
                        <div class="w-200 mw-200px me-3">
                            <select name="<{$k}>" id="search_<{$k}>" class="layui-input" data-control="select2"  data-hide-search="true"  data-placeholder="<{$_dbfield.allTableField[$k]}>">
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
                        <button type="submit" class="layui-btn layui-btn-normal" style="margin-top: 0;">
                            <i class="layui-icon layui-icon-search"></i> 搜索
                        </button>
                        <?php } ?>
            
            
            
                    </form>
				</div>
			</div>
			<div class="layui-card-body">
                <form id="form_list" name="form_list" method="POST" action="?ct=<{$ct}>&amp;ac=batch_update">
                    <input type="hidden" id="do_action" name="do_action" value="" />
                    <table class="layui-table" lay-skin="line">
                        <tbody>
                        <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                            <th width="50"><input type="checkbox" id="allChoose" onclick="toggleAllCheckbox(this)"></th>
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
            
                            <th>管理</th>
                        </tr>
                        <{if !empty($data_list)}>
                            <{foreach key=key item=v from=$data_list}>
                            <tr>
                                <td><input type="checkbox" class="order-checkbox" name="ids[<{$v[$_dbfield.mainKey]}>]" value="<{$v[$_dbfield.mainKey]}>" onclick="checkAllSelected()"></td>
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
                                                        <{if $v[$field]==$vv.id}><{$vv.name}>(<{$v[$field]}>)<{/if}>
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
                                                <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{if $field=='createtime' || $field=='paytime'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$v[$field]}><{/if}>"  class="text <{if !empty($_dbfield[$field].element.class)}><{$_dbfield[$field].element.class}><{else}>s<{/if}>" <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                                            <{else}>
                                                <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                                    <img title="<{$v[$field]}>" alt="<{$v[$field]}>" src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="width:80px;height:60px;" />
                                                <{else}>
                                                    <{if $field=='createtime' || $field=='paytime'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{elseif $field=='data.gender'}>
                                                      <{if  $v.type==4}>无<{else}><{if  $v.data.gender==0}>女<{else}>男<{/if}><{/if}>
                                                      <{elseif $field=='data.time'}>
                                                    <{if  $v.data.y || $v.data.year}><{$v.data.y}><{$v.data.year}>-<{$v.data.m}><{$v.data.month}>-<{$v.data.d}><{$v.data.day}>时辰<{$v.data.h}><{$v.data.hour}>
                                                      <{else}>无<{/if}>
                                                       <{elseif $field=='uid'}>
                                                         <{if $v.uid}><{$v[$field]}><{else}>无<{/if}>
                                                       <{elseif $field=='oid'}>
                                                         <a  href="<{$url}>/?ac=history&state=2&oids=<{$v[$field]}>" target="_blank"><{$v[$field]}></a>
                                                      <{else}><{$v[$field]}>
                                                      <{/if}>
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
            
                                <td style="white-space: nowrap;">
                                    <{if isset($_dbfield.editTableField) && !empty($_dbfield.editTableField)}>
                                        <{if isset($_allowAction.edit) && !empty($_allowAction.edit)}>
                                            <button type="button" onclick="edit('?ct=<{$ct}>&amp;ac=edit&amp;id=<{$v[$_dbfield.mainKey]}>&amp;page_no=<{$current_page}>');" class="layui-btn layui-btn-xs" style="background-color: #1E9FFF; margin-right: 5px;">
                                                <i class="layui-icon layui-icon-edit"></i> <{if $_allowAction.edit.title!=''}><{$_allowAction.edit.title}><{else}>编辑<{/if}>
                                            </button>
                                        <{/if}>
                                    <{/if}>
            
                                    <{if isset($_allowAction.delete) && !empty($_allowAction.delete)}>
                                        <button type="button" onclick="confirmDeleteOrder('?ct=<{$ct}>&amp;ac=delete&amp;id=<{$v[$_dbfield.mainKey]}>');" class="layui-btn layui-btn-xs layui-btn-danger" style="margin-right: 5px;">
                                            <i class="layui-icon layui-icon-delete"></i> <{if $_allowAction.delete.title!=''}><{$_allowAction.delete.title}><{else}>删除<{/if}>
                                        </button>
                                    <{/if}>
            
                                    <{if isset($_allowAction._extend) && !empty($_allowAction._extend)}>
                                        <{foreach from=$_allowAction._extend item=vext key=url}>
                                            <{if $vext.type=='dialog'}>
                                                <button type="button" onclick="add('<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>&TB_iframe=true&width=<{$vext.width}>&height=<{$vext.height}>');" class="layui-btn layui-btn-xs layui-btn-warm" style="margin-right: 5px;">
                                                    <i class="layui-icon layui-icon-read"></i> <{if $vext.title!=''}><{$vext.title}><{else}>操作<{/if}>
                                                </button>
                                            <{else}>
                                                <a href='<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>' class="layui-btn layui-btn-xs" style="background-color: #009688; margin-right: 5px;">
                                                    <i class="layui-icon layui-icon-search"></i> <{if $vext.title!=''}><{$vext.title}><{else}>查看<{/if}>
                                                </a>
                                            <{/if}>
                                        <{/foreach}>
                                    <{/if}>
                                </td>
                            </tr>
                            <{/foreach}>
                            <{else}>
                            <tr>
                                <td colspan="<{$_dbfield.allTableField|count}>" align="center">数据为空</td>
                            </tr>
                            <{/if}>
            
                        </tbody></table>
                </form>
                
                <!-- 分页 -->
                <div class="pagination-wrapper" style="margin-top: 20px; text-align: center;">
                    <div style="display: inline-block;">
                        <{$pages}>
                    </div>
                </div>
                
                <style>
                .pages, .pages * {
                    display: inline-block !important;
                    vertical-align: middle !important;
                }
                .pages a, .pages span, .pages strong {
                    padding: 5px 12px !important;
                    margin: 0 3px !important;
                    border: 1px solid #ddd !important;
                    border-radius: 3px !important;
                    background: #fff !important;
                    color: #333 !important;
                    text-decoration: none !important;
                    min-width: 36px !important;
                    text-align: center !important;
                }
                .pages a:hover {
                    background: #1E9FFF !important;
                    color: #fff !important;
                    border-color: #1E9FFF !important;
                }
                .pages .current, .pages strong {
                    background: #1E9FFF !important;
                    color: #fff !important;
                    border-color: #1E9FFF !important;
                }
                </style>
                
			</div>
		</div>
	</div>
	<!-- 订单列表容器结束 -->
    </div>
</div>


<div class="modal fade" id="add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable mw-600px">
        <div class="modal-content">
            <div class="modal-header">
                <h2>添加</h2>
                <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                    <span class="svg-icon svg-icon-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                        </svg>
                    </span>
                </div>
            </div>
            <div class="modal-body py-lg-10 px-lg-10">
                <iframe id="add_order" style="border: none; width: 100%; height: 50vh; overflow: hidden;" scrolling="no"></iframe>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="edit_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable mw-600px">
        <div class="modal-content">
            <div class="modal-header">
                <h2>添加</h2>
                <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                    <span class="svg-icon svg-icon-1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                        </svg>
                    </span>
                </div>
            </div>
            <div class="modal-body py-lg-10 px-lg-10">
                <iframe id="edit_order" style="border: none; width: 100%; height: 60vh; overflow: hidden;" scrolling="no"></iframe>
            </div>
        </div>
    </div>
</div>

<script>
// 弹窗函数
function add(url) {
    openLayerIframe('新增订单', url, '90%', '90%');
}

function edit(url) {
    openLayerIframe('编辑订单', url, '90%', '90%');
}

// 删除订单确认
function confirmDeleteOrder(url) {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.confirm('确定要删除这条订单吗？删除后将无法恢复！', {
            icon: 3,
            title: '删除确认',
            btn: ['确定删除', '取消']
        }, function(index){
            layer.msg('正在删除...', {icon: 16, shade: 0.3});
            window.location.href = url;
        });
    });
}

function get_value(id) {
    var value = document.getElementById(id).value;
    return value !== '' ? id + '=' + value : 'empty';
}

function more_edit(id) {
    document.getElementById('do_action').value = id;
    document.form_list.submit();
}

function more_edit2(id, url) {
    document.getElementById('do_action').value = id;
    document.form_list.action = url;
    document.form_list.submit();
}

function more_delete(id, url) {
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.confirm('确定要批量删除选中的订单吗？', {
            icon: 3,
            title: '删除确认',
            btn: ['确定删除', '取消']
        }, function(index){
            document.getElementById('do_action').value = id;
            document.form_list.action = url;
            document.form_list.submit();
        });
    });
}

function ajaxSelectChange(id, tag, url) {
    if(id < 1) return false;
    $.post(url, {id: id}, function(data){
        if(data.str == 'success') {
            $('.' + tag).html(data.data);
        } else {
            layui.use('layer', function(){
                layui.layer.msg(data.str, {icon: 2});
            });
        }
    }, 'json');
}

// 给上一页和下一页添加箭头图标
$(document).ready(function(){
    var pageLinks = $('.pages a, .pages span');
    
    if(pageLinks.length > 0) {
        // 第一个按钮是上一页
        var firstBtn = pageLinks.first();
        var firstText = firstBtn.text().trim();
        // 如果是纯数字，说明没有上一页按钮
        if(isNaN(firstText)) {
            firstBtn.html('<i class="layui-icon layui-icon-left"></i>');
            firstBtn.attr('title', '上一页');
        }
        
        // 最后一个按钮是下一页
        var lastBtn = pageLinks.last();
        var lastText = lastBtn.text().trim();
        // 如果是纯数字，说明没有下一页按钮
        if(isNaN(lastText)) {
            lastBtn.html('<i class="layui-icon layui-icon-right"></i>');
            lastBtn.attr('title', '下一页');
        }
    }
});

// 全选/取消全选功能 - 原生JavaScript实现
function toggleAllCheckbox(source) {
    var checkboxes = document.getElementsByClassName('order-checkbox');
    for(var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
    console.log('全选状态:', source.checked, '共', checkboxes.length, '个复选框');
}

// 检查是否全部选中，更新全选框状态
function checkAllSelected() {
    var checkboxes = document.getElementsByClassName('order-checkbox');
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

// 初始化Layui日期选择器
layui.use('laydate', function(){
    var laydate = layui.laydate;
    
    // 日期选择器
    if($('#search_createtime_start').length > 0) {
        laydate.render({
            elem: '#search_createtime_start',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss'
        });
    }
    
    if($('#search_createtime_end').length > 0) {
        laydate.render({
            elem: '#search_createtime_end',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss'
        });
    }
});
</script>

<{include file='admin/footer.html'}>