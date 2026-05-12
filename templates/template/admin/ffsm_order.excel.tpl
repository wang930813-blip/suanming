<{include file="admin/header.html"}>
<div class="app-content flex-column-fluid py-3 py-lg-6">
	<div class="app-container container-fluid">
	    
		<div class="card card-flush">
			<div class="card-header align-items-center py-5 gap-2 gap-md-5">
				<div class="card-title">
					  <form method="GET" action="?ct=ffsm_order&ac=excel_out" style="display: flex;">
   <input type="hidden" value="ffsm_order" name="ct" /> 
   <input type="hidden" value="excel_out" name="ac" />
   
        <div class="fv-row mb-6 me-3">
            <label class="form-label">订单开始时间<{$web_title}></label>
	       <input type="text" id="search_createtime_start" name="createtime_start" value="" class="form-control" readonly="" />
        </div>
        <div class="fv-row mb-6 me-3">
            <label class="form-label">订单结束时间</label>
            <input type="text" id="search_createtime_end" name="createtime_end" value="" class="form-control" readonly="" />
        </div>
        <div class="fv-row mb-6 me-3">
            <label class="form-label">支付状态</label>
           <select name="status" id="search_status" class="form-select w-125px"> 
           <option value="" selected="">所属支付状态</option> 
           <option value="1">待付费</option> 
           <option value="2">已付费</option> 
           </select>
        </div>
        <div class="fv-row mb-6 me-3">
            <label class="form-label">所属栏目</label>
           <select name="type" id="search_type" class="form-select w-125px"> 
           <option value="" selected="">所属栏目</option> 
           <option value="1">八字分析</option>
           <option value="2">八字合婚</option>
           <option value="3">姓名详解</option>
           <option value="4">姓名配对</option>
           <option value="5">紫薇命盘</option>
           <option value="6">八字综合</option>
           <option value="7">婚姻运势</option>
           <option value="8">八字精批</option>
           <option value="9">爱情运势</option>
           <option value="10">精批PC版</option>
           <option value="11">结婚运势</option>
           <option value="12">今年运势</option>
           <option value="13">十年大运</option>
           <option value="14">八字财运</option>
           <option value="16">月老姻缘</option>
           <option value="17">八字合婚</option>
           <option value="18">号码解析</option>
           <option value="26">塔罗运势</option>
           <option value="27">塔罗暗恋</option>
           <option value="28">塔罗心里</option>
           <option value="29">塔罗继续</option>
           <option value="30">塔罗爱情</option>
           <option value="31">塔罗脱单</option>
           <option value="32">塔罗复合</option>
           <option value="33">塔罗最后</option>
           <option value="34">塔罗分手</option>
           <option value="35">塔罗别人</option>
           <option value="37">星座运势</option>
           </select> 
        </div>
        <button type="submit" class="btn btn-primary w-25 h-25 mt-9">导出excel</button>
  </form> 
					
				</div>
			</div>
		</div>
	</div>
</div>

<script>
layui.use(['laydate'], function(){
    var laydate = layui.laydate;
    
    // 开始时间
    laydate.render({
        elem: '#search_createtime_start',
        type: 'datetime',
        format: 'yyyy-MM-dd HH:mm:ss',
        max: 0, // 最大日期为当前时间
        done: function(value, date){
            // 可以在这里添加回调逻辑
        }
    });
    
    // 结束时间
    laydate.render({
        elem: '#search_createtime_end',
        type: 'datetime',
        format: 'yyyy-MM-dd HH:mm:ss',
        max: 0 // 最大日期为当前时间
    });
});
</script>

<{include file='admin/footer.html'}>