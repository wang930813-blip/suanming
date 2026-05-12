<?php /* Smarty version 2.6.25, created on 2025-12-05 16:12:26
         compiled from admin/index.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="layui-fluid">
    
    <?php if ($this->_tpl_vars['userinfo']['uid'] == 1): ?>
    <!-- 全部数据统计 -->
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 18px;">全部数据统计</legend>
    </fieldset>
    
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">今日成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['row_Todays']['s_money']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['row_Todays']['s_count']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['row_Todays']['f_count']; ?>
笔
                        <br>成交率: <?php echo $this->_tpl_vars['row_Todays']['wcl']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">昨日成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['row_Yesterdays']['s_money']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['row_Yesterdays']['s_count']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['row_Yesterdays']['f_count']; ?>
笔
                        <br>成交率: <?php echo $this->_tpl_vars['row_Yesterdays']['wcl']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">本月成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['row_Thismonths']['s_money']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['row_Thismonths']['s_count']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['row_Thismonths']['f_count']; ?>
笔
                        <br>成交率: <?php echo $this->_tpl_vars['row_Thismonths']['wcl']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">历史累计成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['row_alls']['s_money']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['row_alls']['s_count']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['row_alls']['f_count']; ?>
笔
                        <br>成交率: <?php echo $this->_tpl_vars['row_alls']['wcl']; ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php endif; ?>
    
    <!-- 每日数据统计 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend style="font-size: 18px;">每日数据统计</legend>
    </fieldset>
    
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">今日成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['data']['total_today']['total']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['data']['total_today']['numpay']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['data']['total_today']['numall']; ?>
笔
                        <br>完成率: <?php echo $this->_tpl_vars['data']['total_today']['bili']; ?>
 | 总佣金: <?php echo $this->_tpl_vars['data']['total_today']['lirun']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">昨日成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['data']['total_yesterday']['total']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['data']['total_yesterday']['numpay']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['data']['total_yesterday']['numall']; ?>
笔
                        <br>完成率: <?php echo $this->_tpl_vars['data']['total_yesterday']['bili']; ?>
 | 总佣金: <?php echo $this->_tpl_vars['data']['total_yesterday']['lirun']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">本月成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['data']['total_smonth']['total']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['data']['total_smonth']['numpay']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['data']['total_smonth']['numall']; ?>
笔
                        <br>完成率: <?php echo $this->_tpl_vars['data']['total_smonth']['bili']; ?>
 | 总佣金: <?php echo $this->_tpl_vars['data']['total_smonth']['lirun']; ?>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-body stat-card">
                    <div class="stat-label">历史累计成交金额</div>
                    <div class="stat-value">¥<?php echo $this->_tpl_vars['data']['total']['total']; ?>
</div>
                    <div class="stat-sub">
                        已支付: <?php echo $this->_tpl_vars['data']['total']['numpay']; ?>
笔 | 未支付: <?php echo $this->_tpl_vars['data']['total']['numall']; ?>
笔
                        <br>完成率: <?php echo $this->_tpl_vars['data']['total']['bili']; ?>
 | 总佣金: <?php echo $this->_tpl_vars['data']['total']['lirun']; ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 分销代理说明 -->
    <div class="layui-card" style="margin-top: 30px;">
        <div class="layui-card-header" style="font-size: 16px; font-weight: bold;">
            <i class="layui-icon layui-icon-tips"></i> 分销代理推广链接说明
        </div>
        <div class="layui-card-body">
            <blockquote class="layui-elem-quote">
                <p><strong>复制你的专属推广链接，只要用户下单你即可获取提成。</strong></p>
                <p><strong>关于提现：</strong>请到提现管理栏目，申请提现，提现方式为微信或者支付宝，任何时间内申请提现最迟24小时内到账。</p>
                <p><strong>分成比例：</strong>请咨询一级管理员或者联系源码开发者，分销提成比例一级管理员可在后台设置，可设置一二级代理提成比例。</p>
                <p>如果你有任何疑问，获取解答！祝我们合作共赢！</p>
            </blockquote>
        </div>
    </div>
    
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'admin/footer_layui.html', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>