<{include file="admin/header.html"}>
<div class="layui-fluid">
	    
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
	    
		<div class="layui-card">
			<div class="layui-card-header">
				<div>
    				<form method="GET" action="?" style="display: flex;">
                        <input type="hidden" value="<{$ct}>" name="ct">
                        <input type="hidden" value="<{$ac}>" name="ac">
            
                        <?php $boolSearchMust = false;?>
                        <{foreach from=$_dbfield key=k item=v}>
            
                        <{if isset($v.search) && $v.search==1}>
                        <{if $v.element.e_name=='input' && !empty($v.element.e_type)}>
                        
                        <div class="w-200 mw-200px me-3">
                            <input class="layui-input" type="<{$v.element.e_type}>" id="search_<{$k}>" name="<{$k}>" value="<?php echo $this->_tpl_vars['search'.$this->_tpl_vars['k']] ?>" class="text m" <{if isset($v.element.jstype) && $v.element.jstype!=''}>jstype="<{$v.element.jstype}>"<{/if}>  placeholder="<{$_dbfield.allTableField[$k]}>">
                        </div>
                        <?php $boolSearchMust = true;?>
                        
                        
            
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
                        <button type="submit" class="layui-btn layui-btn-normal">搜索</button>
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
                            <th width="20"><input type="checkbox" class="form-check-input" rel="parent" value="" name=""></th>
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
                                <td><input type="checkbox" class="form-check-input" rel="child" value="<{$v[$_dbfield.mainKey]}>" name="ids[<{$v[$_dbfield.mainKey]}>]"></td>
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
                                                <input type="text" name="<{$field}>[<{$v[$_dbfield.mainKey]}>]" value="<{if $field=='createtime' || $field=='paytime'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$v[$field]}><{/if}>"  class="text <{if !empty($_dbfield[$field].element.class)}><{$_dbfield[$field].element.class}><{else}>s<{/if}>" <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
                                            <{else}>
                                                <{if isset($_dbfield[$field].element.type) && $_dbfield[$field].element.type=='image' && isset($_dbfield[$field].element.src) && $v[$field]!=''}>
                                                    <img title="<{$v[$field]}>" alt="<{$v[$field]}>" src="<{$_dbfield[$field].element.src}><{$v[$field]}>" style="width:80px;height:60px;" />
                                                <{else}>
                                                    <{if $field=='createtime' || $field=='paytime'}><{$v[$field]|date_format:'%Y-%m-%d %H:%M:%S'}><{else}><{$v[$field]}><{/if}>
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
            
                                <td>
            

            
            
            
            
            
								<a href="#" class="layui-btn layui-btn-xs" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">更多操作 
								<i class="ki-duotone ki-down fs-5 ms-1"></i></a>
								<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
                                    
                                    <{if isset($_dbfield.editTableField) && !empty($_dbfield.editTableField)}>
                                        <{if isset($_allowAction.edit) && !empty($_allowAction.edit)}>
                                            
                                            
    									<div class="menu-item px-3">
    										<a href="?ct=<{$ct}>&amp;ac=settlement&amp;id=<{$v[$_dbfield.mainKey]}>&amp;page_no=<{$current_page}>" class="menu-link px-3" data-kt-ecommerce-product-filter="delete_row"><{if $_allowAction.edit.title!=''}>结 算<{else}>结 算<{/if}></a>
    									</div>
                                        <{/if}>
                                    <{/if}>
            
                                    <{if isset($_allowAction._extend) && !empty($_allowAction._extend)}>
                                        <{foreach from=$_allowAction._extend item=vext key=url}>
                                            <{if $vext.type=='dialog'}>
                                                <button type="button" onclick="tb_show('<{$vext.title}>','<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>&TB_iframe=true&width=<{$vext.width}>&height=<{$vext.height}>',true);"><{if $vext.title!=''}><{$vext.title}><{else}>未知操作名称<{/if}></button>&nbsp; &nbsp;
                                            <{else}>
                                                <a href='<{$url}>&<{$vext.paramto}>=<{$v[$vext.paramfrom]}>' class="btn" style="cursor:pointer;"><{if $vext.title!=''}><{$vext.title}><{else}>未知操作名称<{/if}></a>
                                            &nbsp;&nbsp;
                                            <{/if}>
                                        <{/foreach}>
                                    <{/if}>
								</div>
								
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
                
			</div>
	</div>
</div>



<{include file='admin/footer.html'}>
<script src="/acs/demo1/plugins/custom/datatables/datatables.bundle.js"></script>
<script src="/acs/demo1/js/custom/apps/ecommerce/catalog/products.js"></script>

<script src="images/js/util.js" type="text/javascript"></script>
<script src="images/js/frm.js" type="text/javascript"></script>
<script src="images/js/tb-box.js" type="text/javascript"></script>


