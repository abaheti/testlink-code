{* Testlink Open Source Project - http://testlink.sourceforge.net/ *}
{* $Id: inc_head.tpl,v 1.6 2006/06/20 19:51:32 schlundus Exp $ *}
{* Purpose: smarty template - HTML Common Header *}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$pageCharset}" />
	<meta http-equiv="Content-language" content="en" />
	<meta http-equiv="expires" content="-1" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta name="author" content="Martin Havlat" />
	<meta name="copyright" content="GNU" />
	<meta name="robots" content="NOFOLLOW" />
	<base href="{$basehref}"/>
	<title>{$title|default:"TestLink"}</title>
	<style media="all" type="text/css">@import "{$css}";</style>
	<style type="text/css"> body {ldelim}background: {$testprojectColor};{rdelim}</style>
	<style media="print" type="text/css">@import "gui/css/tl_print.css";</style>
	<script type="text/javascript" src="gui/javascript/testlink_library.js" language="javascript"></script>
{if $jsValidate == "yes"} 
	<script type="text/javascript" src="gui/javascript/validate.js" language="javascript"></script>
{/if}
{if $jsTree == "yes"} {* 'no' is default defined in config *}
	{include file="inc_jsTree.tpl"}
{/if}
	<script type="text/javascript" language="javascript">
	var fRoot = '{$basehref}';
	var menuUrl = '{$menuUrl}';
	var args  = '{$args}';
	
	// 20050528 - fm
	// To solve problem diplaying help
	var SP_html_help_file  = '{$SP_html_help_file}';
	
	//attachment related JS-Stuff
	var attachmentDlg_refWindow = null;
	var attachmentDlg_refLocation = null;
	var attachmentDlg_bNoRefresh = false;
	</script> 
{if $openHead == "no"} {* 'no' is default defined in config *}
</head>
{/if}
