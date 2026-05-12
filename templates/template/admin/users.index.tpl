<{include file="admin/header.tpl"}>
<script lang='javascript'>
function show_data(nid)
{
    tb_show('浏览/编辑记录', '?ct=users&even=edit&tb=users&uid='+ nid +'&TB_iframe=true&height=450&width=700', true);
}
function do_delete()
{
    document.form1.even.value = 'delete';
    var msg = "你确定要删除选中的记录？！";
    msg += "<br/><a href='javascript:tb_remove();'>&lt;&lt;点错了</a> &nbsp;|&nbsp; <a href='javascript:document.form1.submit();'>确定要删除&gt;&gt;</a>";
    tb_showmsg(msg);
}
</script>

<div id="contents">

<form name="formsearch" action="?ct=users&even=list" method="POST">
<input type='hidden' name='tb' value='users' />
<input type='hidden' name='orderby' value='' />
<dl class="search-class">
    <dd>
    关键字：
    <input type='text' name='keyword' style='width:200px;' class='text' value="<{request_em key='keyword'}>" />
    <button type='submit'>搜索</button>
    </dd>
</dl>
</form>

<form name="form1" action="?ct=users" method="POST">
<input type='hidden' name='tb' value='users' />
<input type="hidden" name="even" value="delete" />
<table class="table-sort table-operate">
  <tr>
      <td> <a href='javascript:select_all(null);'>选择</a> </td>
    <td><strong>uid</strong></td>
    <td><strong>sd_uid</strong></td>
    <td><strong>user_name</strong></td>
    <td><strong>nickname</strong></td>
    <td><strong>userpwd</strong></td>
    <td><strong>38包月39年费会员40终身会员</strong></td>
    <td><strong> 年费会员截止时间</strong></td>
    <td><strong>phone</strong></td>
    <td><strong>qq</strong></td>
    <td><strong>邮箱</strong></td>
    <td><strong>pools</strong></td>
    <td><strong>groups</strong></td>
    <td><strong>regtime</strong></td>
    <td><strong>regip</strong></td>
    <td><strong>sta</strong></td>
    <td><strong>dl_syjf</strong></td>
    <td><strong>dl_zjf</strong></td>
    <td><strong>dl_tcbl</strong></td>
    <td><strong>积分</strong></td>
    <td><strong>头像</strong></td>
    <td><strong>授权平台（1注册2微信3QQ）	</strong></td>
    <td><strong>logintime</strong></td>
    <td><strong>loginip</strong></td>

  </tr>
  <{lurd_list item='v'}>
  <tr>
      <td><a href="javascript:show_data('<{$v.uid}>');"><img src='/static/images/ico-edit.png' alt='修改' title='修改' border='0' /></a><input type='checkbox' name='uid[]' value='<{$v.uid}>' /></td>
  <td> <{$v.uid}> </td>
  <td> <{$v.sd_uid}> </td>
  <td> <{$v.user_name}> </td>
  <td> <{$v.nickname}> </td>
  <td> <{$v.userpwd}> </td>
  <td> <{$v.vip_type}> </td>
  <td> <{$v.vip_time}> </td>
  <td> <{$v.phone}> </td>
  <td> <{$v.qq}> </td>
  <td> <{$v.email}> </td>
  <td> <{$v.pools}> </td>
  <td> <{$v.groups}> </td>
  <td> <{$v.regtime}> </td>
  <td> <{$v.regip}> </td>
  <td> <{$v.sta}> </td>
  <td> <{$v.dl_syjf}> </td>
  <td> <{$v.dl_zjf}> </td>
  <td> <{$v.dl_tcbl}> </td>
  <td> <{$v.integral}> </td>
  <td> <{$v.headimgurl}> </td>
  <td> <{$v.class}> </td>
  <td> <{lurd do="format_date" var=$v.logintime format="" }> </td>
  <td> <{$v.loginip}> </td>

  </tr>
  <{/lurd_list}>
  <tr>
</table>
</form>
</div>

<div id="bottom">
    <div class="fl">
        <button type="button" onclick="tb_show('增加记录', '?ct=users&even=add&tb=users&TB_iframe=true&height=550&width=800', true)">增加记录</button>
        <button type="button" onclick="do_delete();">删除选中记录</button>
    </div>
    <div class="pages">
        <{$lurd_pagination}>
    </div>
</div>

</body>
</html>
 