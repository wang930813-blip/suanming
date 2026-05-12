<?php /* Smarty version 2.6.25, created on 2025-12-05 16:05:50
         compiled from admin/footer.html */ ?>
    </div>
    <!-- 底部 -->
    <div class="layui-footer" style="text-align: center; color: #999; padding: 15px 0;">
        © 2026 狗凯之家源码网在线测算 - 管理后台 | 微信 goukaizhijia
    </div>
</div>

<script>
// 全局工具函数
layui.use(['layer', 'element'], function(){
    var layer = layui.layer;
    var element = layui.element;
    
    /**
     * 打开Layui Layer iframe弹窗（统一封装）
     * @param {string} title - 弹窗标题
     * @param {string} url - iframe URL
     * @param {string} width - 宽度，如 '650px' 或 '80%'
     * @param {string} height - 高度，如 '500px' 或 '80%'
     * @param {function} endCallback - 关闭后的回调函数
     */
    window.openLayerIframe = function(title, url, width, height, endCallback) {
        width = width || '800px';
        height = height || '600px';
        
        layer.open({
            type: 2,
            title: title || '窗口',
            shadeClose: false,
            shade: 0.5,
            maxmin: true,
            area: [width, height],
            content: url,
            end: function() {
                if (typeof endCallback === 'function') {
                    endCallback();
                } else {
                    // 默认刷新父页面
                    location.reload();
                }
            }
        });
    };
    
    /**
     * 确认删除弹窗
     * @param {string} message - 确认消息
     * @param {string} url - 删除URL
     */
    window.confirmDelete = function(message, url) {
        layer.confirm(message || '确定要删除吗？', {
            icon: 3,
            title: '删除确认',
            btn: ['确定删除', '取消']
        }, function(index){
            layer.msg('正在删除...', {
                icon: 16,
                shade: 0.3,
                time: 0
            });
            window.location.href = url;
        });
    };
    
    /**
     * 显示成功消息
     * @param {string} msg - 消息内容
     * @param {function} callback - 回调函数
     */
    window.showSuccess = function(msg, callback) {
        layer.msg(msg || '操作成功', {
            icon: 1,
            time: 1500
        }, callback);
    };
    
    /**
     * 显示错误消息
     * @param {string} msg - 消息内容
     * @param {function} callback - 回调函数
     */
    window.showError = function(msg, callback) {
        layer.msg(msg || '操作失败', {
            icon: 2,
            time: 2000
        }, callback);
    };
    
    /**
     * 显示加载中
     * @param {string} msg - 加载消息
     * @returns {number} - layer索引，用于关闭
     */
    window.showLoading = function(msg) {
        return layer.msg(msg || '加载中...', {
            icon: 16,
            shade: 0.3,
            time: 0
        });
    };
    
    /**
     * 关闭加载
     * @param {number} index - layer索引
     */
    window.hideLoading = function(index) {
        if (index !== undefined) {
            layer.close(index);
        }
    };
    
    /**
     * 批量删除确认
     * @param {string} formId - 表单ID
     * @param {string} deleteUrl - 删除URL
     */
    window.batchDelete = function(formId, deleteUrl) {
        var checkedCount = $('input[name="id[]"]:checked').length;
        
        if (checkedCount === 0) {
            showError('请至少选择一项');
            return false;
        }
        
        layer.confirm('确定要删除选中的 ' + checkedCount + ' 项吗？', {
            icon: 3,
            title: '批量删除确认',
            btn: ['确定删除', '取消']
        }, function(index){
            layer.msg('正在删除...', {icon: 16, shade: 0.3});
            $('#' + formId).attr('action', deleteUrl).submit();
        });
    };
    
    /**
     * 全选/取消全选
     */
    $('[name="checkAll"]').on('click', function(){
        var isChecked = $(this).prop('checked');
        $('[name="id[]"]').prop('checked', isChecked);
    });
    
    // 单个checkbox变化时检查全选状态
    $(document).on('change', '[name="id[]"]', function(){
        var total = $('[name="id[]"]').length;
        var checked = $('[name="id[]"]:checked').length;
        $('[name="checkAll"]').prop('checked', total === checked);
    });
});

/**
 * 格式化时间戳
 * @param {number} timestamp - 时间戳（秒）
 * @param {string} format - 格式，默认 'Y-m-d H:i:s'
 * @returns {string}
 */
function formatTime(timestamp, format) {
    format = format || 'Y-m-d H:i:s';
    var date = new Date(timestamp * 1000);
    
    var formatObj = {
        Y: date.getFullYear(),
        m: ('0' + (date.getMonth() + 1)).slice(-2),
        d: ('0' + date.getDate()).slice(-2),
        H: ('0' + date.getHours()).slice(-2),
        i: ('0' + date.getMinutes()).slice(-2),
        s: ('0' + date.getSeconds()).slice(-2)
    };
    
    for (var key in formatObj) {
        format = format.replace(key, formatObj[key]);
    }
    
    return format;
}

/**
 * 格式化金额
 * @param {number} amount - 金额
 * @param {number} decimals - 小数位数，默认2
 * @returns {string}
 */
function formatMoney(amount, decimals) {
    decimals = decimals !== undefined ? decimals : 2;
    amount = parseFloat(amount) || 0;
    return amount.toFixed(decimals).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

/**
 * 复制到剪贴板
 * @param {string} text - 要复制的文本
 */
function copyToClipboard(text) {
    var textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    document.body.appendChild(textarea);
    textarea.select();
    
    try {
        document.execCommand('copy');
        showSuccess('复制成功');
    } catch (err) {
        showError('复制失败，请手动复制');
    }
    
    document.body.removeChild(textarea);
}

// 防止页面被iframe嵌套（安全措施）
if (window.top !== window.self && window.location.pathname.indexOf('/acs/') !== -1) {
    // 如果当前页面被嵌套且不是特定的iframe页面，则跳出
    if (!window.location.search.includes('TB_iframe=true')) {
        window.top.location.href = window.location.href;
    }
}
</script>
</body>
</html>