{*
TestLink Open Source Project - http://testlink.sourceforge.net/
Id: reqAssign.tpl,v 1.6 2006/07/15 19:55:30 schlundus Exp $

Author: Francisco Mancardi

Purpose: Requirements Bulk Assignment
         
rev: 20081130 - franciscom - BUGID 1852 - Bulk Assignment Feature         
*}
{lang_get var="labels"
          s="req_doc_id,scope,req,req_title_bulk_assign,no_req_spec_available,
             please_select_a_req,test_case,req_title_assign,btn_close,
             req_spec,warning,req_title_available,req_title_assigned,
             check_uncheck_all_checkboxes,req_msg_norequirement,btn_unassign,
             req_title_unassigned,check_uncheck_all_checkboxes,
             req_msg_norequirement,btn_assign"}

{include file="inc_head.tpl" openHead="yes"}
{include file="inc_jsCheckboxes.tpl"}
{include file="inc_del_onclick.tpl"}

<script type="text/javascript">
	var please_select_a_req="{$labels.please_select_a_req}";
	var alert_box_title = "{$labels.warning}";
{literal}

function check_action_precondition(form_id,action)
{
	if(checkbox_count_checked(form_id) <= 0)
	{
		alert_message(alert_box_title,please_select_a_req);
		return false;
	}
	return true;
}
</script>
{/literal}
</head>
<body>
<h1 class="title">
	{$gui->pageTitle|escape}
	{include file="inc_help.tpl" helptopic="hlp_requirementsCoverage"}
</h1>

{if $gui->has_req_spec}

    <div class="workBack">
      <h2>{$labels.req_title_bulk_assign}</h2>
      <form id="SRS_switch" name="SRS_switch" method="post">
 	      <input type="hidden" name="doAction" id="doAction" value="switchspec">
 	      <input type="hidden" name="id" id="id" value="{$gui->tsuite_id}">
        <p><span class="labelHolder">{$labels.req_spec}</span>
      	<select name="idSRS" onchange="form.submit()">
      	{html_options options=$gui->req_specs selected=$gui->selectedReqSpec}</select>
      </form>
      {if $gui->user_feedback != ''}<br><br>{/if}
      {include file="inc_update.tpl" user_feedback=$gui->user_feedback}
    </div>
    <div class="workBack">
      <h2>{$labels.req_title_available}</h2>
      {if $gui->requirements != ""}
          {if $gui->tcase_number > 0}
             {$gui->bulkassign_warning_msg}<br />
          {/if}

        <form id="reqList" method="post" action="lib/requirements/reqTcAssign.php">
           <input type="hidden" name="id" id="id"  value="{$gui->tsuite_id}" />
 
        <div id="div_assigned_req">
     	    {* used as memory for the check/uncheck all checkbox javascript logic *}
           <input type="hidden" name="memory_assigned_req"
                                id="memory_assigned_req"  value="0" />
    
        <input type="hidden" name="idSRS" value="{$gui->selectedReqSpec}" />
        <table class="simple">
        	<tr>
          		<th align="center"  style="width: 5px;background-color:#005498;">
          		    <img src="{$smarty.const.TL_THEME_IMG_DIR}/toggle_all.gif"
          		             onclick='cs_all_checkbox_in_div("div_assigned_req","assigned_req","memory_assigned_req");'
          		             title="{$labels.check_uncheck_all_checkboxes}" />
          		</th>
        		<th>{$labels.req_doc_id}</th>
        		<th>{$labels.req}</th>
        		<th>{$labels.scope}</th>
        	</tr>
        	{section name=row loop=$gui->requirements}
        	<tr>
        		<td><input type="checkbox" id="assigned_req{$gui->requirements[row].id}"
        		                           name="req_id[{$gui->requirements[row].id}]" /></td>
        		<td><span class="bold">{$gui->requirements[row].req_doc_id|escape}</span></td>
        		<td><span class="bold"><a href="lib/requirements/reqView.php?requirement_id={$gui->requirements[row].id}">
        			{$gui->requirements[row].title|escape}</a></span></td>
        		<td>{$gui->requirements[row].scope|strip_tags|strip|truncate:30}</td>
        	</tr>
        	{sectionelse}
        	<tr><td></td><td><span class="bold">{$labels.req_msg_norequirement}</span></td></tr>
        	{/section}
        </table>
       	</div>
    
        {if $smarty.section.row.total > 0}
        	<div class="groupBtn">
        	  <input type="hidden" name="doAction" id="doAction" value="bulkassign">
        		<input type="submit" name="actionButton" value="{$labels.btn_assign}"
 		    		       onclick="return check_action_precondition('reqList');"/>
        	</div>
        {/if}
      </form>
    {/if}
    
    </div>



{else}
    {$labels.no_req_spec_available}
{/if}
</body>
</html>
