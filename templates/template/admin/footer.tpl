    </div>
    
    <!-- 底部 -->
    <div class="layui-footer" style="text-align: center; background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%); box-shadow: 0 -2px 10px rgba(0,0,0,0.05);">
        <span style="color: #666;"> 2026 管理后台</span>
    </div>
</div>

<script src="/ffsm/statics/ffsm/kmmb/layui/layui.js"></script>
<script>
layui.use(['element', 'layer', 'form'], function(){
    var element = layui.element;
    var layer = layui.layer;
    var form = layui.form;
    
    // 监听导航点击
    element.on('nav(side-nav)', function(elem){
        // 添加点击动画效果
        $(elem).addClass('layui-anim layui-anim-scale');
        setTimeout(function(){
            $(elem).removeClass('layui-anim layui-anim-scale');
        }, 300);
    });
    
    // 全局初始化表单
    form.render();
});

// 刷新页面函数
function refreshPage() {
    layer.msg('', {
        icon: 16,
        shade: 0.01,
        time: 500
    });
    setTimeout(function(){
        location.reload();
    }, 500);
}

// 通用弹窗函数
function openLayerIframe(title, url, width, height) {
    width = width || '90%';
    height = height || '90%';
    if (typeof width === 'string' && width.indexOf('px') === -1 && width.indexOf('%') === -1) {
        width = width + 'px';
    }
    if (typeof height === 'string' && height.indexOf('px') === -1 && height.indexOf('%') === -1) {
        height = height + 'px';
    }
    
    layer.open({
        type: 2,
        title: title,
        area: [width, height],
        shade: 0.3,
        maxmin: true,
        anim: 1,
        content: url,
        end: function(){
            refreshPage();
        }
    });
}

// 通用确认删除
function confirmDelete(url, msg) {
    msg = msg || '确定要删除吗？';
    layer.confirm(msg, {
        icon: 3,
        title: '删除确认',
        btn: ['确定删除', '取消'],
        btn1: function(index){
            layer.msg('正在删除...', {icon: 16, shade: 0.3});
            window.location.href = url;
        }
    });
    return false;
}

// 通用提示
function showMsg(msg, icon) {
    icon = icon || 1;
    layer.msg(msg, {
        icon: icon,
        time: 2000
    });
}

// 成功提示
function showSuccess(msg) {
    layer.msg(msg, {
        icon: 1,
        time: 2000
    });
}

// 错误提示
function showError(msg) {
    layer.msg(msg, {
        icon: 2,
        time: 2000
    });
}
</script>
</body>
</html>
