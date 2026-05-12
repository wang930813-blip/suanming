<section class="scProd_footer">
    <{if $footerIcon|default:''}>
        <img src="<{$footerIcon}>" alt="" /> 
    <{else}>
        <img src="zeri/picture/footicon.png" alt="" /> 
    <{/if}>
    安全网络 请放心使用

    <{if $contact.lianxifs}>
    <br/>微信号：<a href="javascript:void(0);" data-clipboard-text="<{$contact.lianxifs}>" class="copy_wx" style="text-decoration:none;"><{$contact.lianxifs}></a>
    <{/if}>
    <{if $contact.kefulj}>
    <br/><a href="<{$contact.kefulj}>" target="_blank" style="text-decoration:none;">联系客服</a>
    <{/if}>
</section>
