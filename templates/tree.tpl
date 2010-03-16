{*
 *  tree.tpl
 *  gitphp: A PHP git repository browser
 *  Component: Tree view template
 *
 *  Copyright (C) 2009 Christopher Han <xiphux@gmail.com>
 *}

 {include file='header.tpl'}

 {* Nav *}
   <div class="page_nav">
     <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=summary">summary</a> | <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=shortlog&h={$hashbase->GetHash()}">shortlog</a> | <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=log&h={$hashbase->GetHash()}">log</a> | <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=commit&h={$hashbase->GetHash()}">commit</a> | <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=commitdiff&h={$hashbase->GetHash()}">commitdiff</a> | tree<br /><br />
   </div>

 {include file='title.tpl' titlecommit=$hashbase}

 {include file='path.tpl' pathobject=$tree target='tree'}
 
 <div class="page_body">
   {* List files *}
   <table cellspacing="0">
     {foreach from=$tree->GetContents() item=treeitem}
       <tr class="{cycle values="light,dark"}">
         <td class="monospace">{$treeitem->GetModeString()}</td>
         {if $treeitem instanceof GitPHP_Blob}
	   <td>{$treeitem->GetSize()}</td>
           <td class="list">
             <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=blob&h={$treeitem->GetHash()}&hb={$hashbase->GetHash()}&f={$treeitem->GetPath()}" class="list">{$treeitem->GetName()}</a>
	   </td>
           <td class="link">
	     <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=blob&h={$treeitem->GetHash()}&hb={$hashbase->GetHash()}&f={$treeitem->GetPath()}">blob</a> | <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=history&h={$hashbase->GetHash()}&f={$treeitem->GetPath()}">history</a>
	   </td>
         {elseif $treeitem instanceof GitPHP_Tree}
	   <td></td>
           <td class="list">
             <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=tree&h={$treeitem->GetHash()}&hb={$hashbase->GetHash()}&f={$treeitem->GetPath()}">{$treeitem->GetName()}</a>
	   </td>
           <td class="link">
	     <a href="{$SCRIPT_NAME}?p={$project->GetProject()}&a=tree&h={$treeitem->GetHash()}&hb={$hashbase->GetHash()}&f={$treeitem->GetPath()}">tree</a>
	   </td>
         {/if}
       </tr>
     {/foreach}
   </table>
 </div>

 {include file='footer.tpl'}

