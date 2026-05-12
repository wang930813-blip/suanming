<{include file="admin/header.html"}>
<div class="app-content flex-column-fluid py-3 py-lg-6">
	<div class="app-container container-fluid">
	    <div class="row mb-xl-8">
	    
	    
	    
	    
		<div class="card card-flush">
			<div class="card-body pt-0" style="padding: 2rem 2.25rem 0rem 2.25rem;">
                
                  <table id="sample-table-1" class="table table-striped table-bordered table-hover" style="margin-top: 20px;">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>分成比例</th>
                            <th>推广链接</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="goodsTb">
                        
                        <tr>
                <td>0</td>
                <td>全量推广</td>
                <td><img src="https://api.nbhao.org/v1/qrcode/make?text=<{$url}>/?dl=<{$userinfo.uid}>" /></td>
                <td><{$userinfo.dl_tcbl}>%</td>
                <td id="tc_box_wei20"><{$url}>/?dl=<{$userinfo.uid}></td>
                <td><button data-clipboard-action="copy" id="btn" data-clipboard-target="#tc_box_wei20" class="btn btn-xs btn-info wxCopynum3">复制推广链接</button></td>
            </tr>
            <{foreach from="$lists" item=v key=k}>
            <tr>
                <td><{$k}></td>
                <td><{$v.title}></td>
                <td><{$v.config}></td>
                <td><{$userinfo.dl_tcbl}>%</td>
                <td id="tc_box_wei<{$k}>"><{$url}>/?ac=<{$v.name}>&dl=<{$userinfo.uid}></td>
                
                <td>
                <button data-clipboard-action="copy" id="btn<{$k}>" data-clipboard-target="#tc_box_wei<{$k}>" class="btn btn-xs btn-info wxCopynum3">复制推广链接</button>
                
                </td>
            </tr>
            <{/foreach}>
            </tbody>
                    </table>
			</div>
		</div>
	</div>
</div>
<{include file='admin/footer.html'}>
<script src="/acs/demo1/plugins/custom/datatables/datatables.bundle.js"></script>
<script src="/acs/demo1/js/custom/apps/ecommerce/catalog/products.js"></script>

<script src="images/js/util.js" type="text/javascript"></script>
<script src="images/js/frm.js" type="text/javascript"></script>
<script src="images/js/tb-box.js" type="text/javascript"></script>


<link href="/static/js/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/clipboard.min.js"></script>
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
	
			$(function(){
			var clipboard = new ClipboardJS('.btn');
			clipboard.on('success', function(e) {
				alert("复制推广链接成功")  
			});
		
    })
	
</script>

<style type="text/css">
.text-hint.normal{color:#F00;}

</style>
