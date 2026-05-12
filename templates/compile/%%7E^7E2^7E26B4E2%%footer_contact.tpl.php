<?php /* Smarty version 2.6.25, created on 2025-12-05 16:08:47
         compiled from ffsm/footer_contact.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'ffsm/footer_contact.tpl', 2, false),)), $this); ?>
<section class="scProd_footer">
    <?php if (((is_array($_tmp=@$this->_tpl_vars['footerIcon'])) ? $this->_run_mod_handler('default', true, $_tmp, '') : smarty_modifier_default($_tmp, ''))): ?>
        <img src="<?php echo $this->_tpl_vars['footerIcon']; ?>
" alt="" /> 
    <?php else: ?>
        <img src="zeri/picture/footicon.png" alt="" /> 
    <?php endif; ?>
    安全网络 请放心使用

    <?php if ($this->_tpl_vars['contact']['lianxifs']): ?>
    <br/>微信号：<a href="javascript:void(0);" data-clipboard-text="<?php echo $this->_tpl_vars['contact']['lianxifs']; ?>
" class="copy_wx" style="text-decoration:none;"><?php echo $this->_tpl_vars['contact']['lianxifs']; ?>
</a>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['contact']['kefulj']): ?>
    <br/><a href="<?php echo $this->_tpl_vars['contact']['kefulj']; ?>
" target="_blank" style="text-decoration:none;">联系客服</a>
    <?php endif; ?>
</section>