<link href="/acs/demo1/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/css/style.bundle.css" rel="stylesheet" type="text/css" />

<form name="myform" jstype="vali" action="?ct=<{$ct}>&ac=add" method="POST"  enctype="multipart/form-data" style="background-color:#fff;">

            <{foreach from=$_dbfield.addTableField item=field}>
            <{if $_dbfield[$field].element.e_name=='input' && $_dbfield[$field].element.e_type}>
                <div class="fv-row mb-6">
                    <label class="form-label">
                            <{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font>
                            <{/if}></label>
                    <input type='<{$_dbfield[$field].element.e_type}>' id="add_<{$field}>" name='<{$field}>' class="form-control text <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>error<{/if}>" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}> value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> /> 
                </div>
                    
                    
                    

            <{elseif $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
      
      
      
        <div class="fv-row mb-6">
            <label class="form-label">所属<{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font><{/if}></label>
            
            
                        <select  class="form-select" name="<{$field}>" id="add_<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}>  <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}>  <{if isset($_dbfield[$field].element.js.onchange) && !empty($_dbfield[$field].element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$_dbfield[$field].element.js.onchange.class}>','<{$_dbfield[$field].element.js.onchange.url}>')"<{/if}>  <{if isset($_dbfield[$field].element.js.ajax) && !empty($_dbfield[$field].element.js.ajax)}>class="<{$_dbfield[$field].element.js.ajax.class}>"<{/if}>>
                        <option value="">所属<{$_dbfield.allTableField[$field]}></option>

                    <{if !isset($_dbfield[$field].element.js.ajax) || empty($_dbfield[$field].element.js.ajax)}>

                        <{foreach from=$_dbfield[$field].element.datafrom key=kk item=vv}>
                        <{if is_array($vv)}>
                        <option value="<{$vv.id}>" ><{$vv.name}></option>
                        <{else}>
                        <option value="<{$kk}>" ><{$vv}></option>
                        <{/if}>
                        <{/foreach}>

                    <{/if}>

                        </select>
                        <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><span class="text-hint normal"><{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}></span><{/if}>
            </div>
      

            <{elseif $_dbfield[$field].element.e_name=='textarea'}>
                
                <div class="fv-row mb-6">
                    <label class="form-label">
        <{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font><{/if}></label>
                    <textarea class="form-control w-100" id="add_<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> name='<{$field}>'  class="text error" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}>></textarea>
                </div>

            <{else}>

            <tr>
                <td>
                    <{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font>
                    <{/if}>
                </td>
                <td>
                    <input type='<{if $_dbfield[$field].element.e_type}><{$_dbfield[$field].element.e_type}><{else}>text<{/if}>' id="add_<{$field}>" name='<{$field}>' class="text <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>error<{/if}>" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}> value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> /> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><span class="text-hint normal"><{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}></span><{/if}></td>
            </tr>

            <{/if}>
            <{/foreach}>

        <div class="text-center">
        <input type='hidden' name='dosubmit' value='true'  />
            <button type="reset" class="btn btn-light w-25 me-3">重置</button>
            <button type="submit" class="btn btn-primary w-25">保存</button>
        </div> 
                    
    </form>

<script src="/acs/demo1/plugins/global/plugins.bundle.js"></script>
<script src="/acs/demo1/js/scripts.bundle.js"></script>
<script src="/acs/demo1/js/widgets.bundle.js"></script>
<script src="/acs/demo1/js/custom/widgets.js"></script>
<script src="/acs/demo1/js/custom/apps/chat/chat.js"></script>
<script src="/acs/demo1/js/custom/utilities/modals/upgrade-plan.js"></script>
<script src="/acs/demo1/js/custom/utilities/modals/create-app.js"></script>
<script src="/acs/demo1/js/custom/utilities/modals/new-target.js"></script>
<script src="/acs/demo1/js/custom/utilities/modals/users-search.js"></script>

<script type="text/javascript">
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
