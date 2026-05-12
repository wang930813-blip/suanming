<link href="/acs/demo1/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="/acs/demo1/css/style.bundle.css" rel="stylesheet" type="text/css" />

<form name="myform" jstype="vali" action="?ct=<{$ct}>&ac=add" method="POST"  enctype="multipart/form-data" onsubmit="return submitForm();"style="background-color:#fff;">
    <table width="100%" class="form">

        <div class="fv-row mb-6">
            <label class="form-label">我的剩余金额：</label>
            
			<font color="red"><{$dl_syjf}> ￥</font>
        </div>
        
        
        
        
        <{foreach from=$_dbfield.addTableField item=field}>
        <{if $_dbfield[$field].element.e_name=='input' && $_dbfield[$field].element.e_type}>
        <{if ($_dbfield[$field].element.richtext)}><script id="<{$field}>_editor" type="text/plain" style="width:1024px;height:500px;"></script><{/if}>
         
        <div class="fv-row mb-6">
            <label class="form-label"><{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font>
                <{/if}></label>
            <input type='<{$_dbfield[$field].element.e_type}>' id="add_<{$field}>" <{if ($_dbfield[$field].element.richtext)}>style="display:none" <{/if}> name='<{$field}>' class="form-control  text <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>error<{/if}>" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}> value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
            <input type="hidden" name="add_time"  value="<?php echo time();?>">
        </div> 
				

        <{elseif $_dbfield[$field].element.e_name=='select' && $_dbfield[$field].element.datafrom}>
      
      
      
      
      
        <div class="fv-row mb-6">
            <label class="form-label"><{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font><{/if}></label>
            
                <select class="form-select"  name="<{$field}>" id="add_<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}>  <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}>  <{if isset($_dbfield[$field].element.js.onchange) && !empty($_dbfield[$field].element.js.onchange)}>onchange="javascript:ajaxSelectChange(this.value,'<{$_dbfield[$field].element.js.onchange.class}>','<{$_dbfield[$field].element.js.onchange.url}>')"<{/if}>  <{if isset($_dbfield[$field].element.js.ajax) && !empty($_dbfield[$field].element.js.ajax)}>class="<{$_dbfield[$field].element.js.ajax.class}>"<{/if}>>
                <option value=""><{$_dbfield.allTableField[$field]}></option>

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
            </div>
        




        <{elseif $_dbfield[$field].element.e_name=='textarea'}>

        <tr>
            <td><{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font><{/if}></td>
            <td><textarea id="add_<{$field}>" <{if isset($_dbfield[$field].element.style)}>style="<{$_dbfield[$field].element.style}>"<{/if}> name='<{$field}>'  class="text error" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}>></textarea> <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><span class="text-hint normal"><{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}></span><{/if}></td>
        </tr>


        <{else}>


        <div class="fv-row mb-6">
            <label class="form-label">
                <{$_dbfield.allTableField[$field]}>:<{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}><font color="red">*</font>
                <{/if}></label>
            
            
                <input type='<{if $_dbfield[$field].element.e_type}><{$_dbfield[$field].element.e_type}><{else}>text<{/if}>' id="add_<{$field}>" name='<{$field}>' class="form-control text <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>error<{/if}>" <{if ($_submit_validate[$field].3=='all' || $_submit_validate[$field].3=='insert') && $_submit_validate[$field].1=='notempty'}>errormsg='<{if $_submit_validate[$field].2}><{$_submit_validate[$field].2}><{else}><{$_dbfield.allTableField[$field]}>必须!<{/if}>' vali='<{$_submit_validate[$field].1}>'<{/if}> value='<{if isset($_addFieldAuto[$field]) && isset($arrAddFieldAuto[$field])}><{$arrAddFieldAuto[$field]}><{/if}>' <{if isset($_dbfield[$field].element.jstype) && $_dbfield[$field].element.jstype!=''}>jstype="<{$_dbfield[$field].element.jstype}>"<{/if}> />
        </div>

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

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('content_editor');

    function submitForm(){
        var contentval = document.getElementById("add_content");
        var contentstr = UE.getEditor('content_editor').getContent();
        if(!UE.getEditor('content_editor').hasContents()){
            alert("内容不能为空！");
            return false;
        }
        if(!contentval){
            alert("内容不能为空！");
            return false;
        }

        contentval.value = contentstr.trim();
        return true;
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
