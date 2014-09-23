<script>		
	$(document).ready(function() {
		$('#form-search').on('submit', function() { 			
			var data = new Object(); 			
	<!--{foreach name=downloadslist from=$smarty_data['header'] item=value}-->
		<!--{if $value['Search']}-->				
			data.<!--{$value['FieldName']|lower}--> = $('#search_<!--{$value['FieldName']|lower}-->').val();				
		<!--{/if}-->
	<!--{/foreach}-->			
			var postData = 'parm=' + encodeURIComponent(escape(JSON.stringify(data)));						
			
			$.ajax({
				type:"POST",
				url:"/ajax/grid/search",
				data: postData,
				cache: false,
				success: function(data){					
					window.location.href="<!--{$smarty_data['premission']['ActionURL']}-->";					
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){						
					alert(textStatus);						
				}
			});					
			
			event.preventDefault();
			return false; 
		});
		
		$('.grid_delete').on('click', function() {			
			var data = new Object(); 			
			var currentId = $(this).attr('id').replace("grid_delete_","");
			data.id = currentId;
			data.modelID = "<!--{$smarty_data['modelID']}-->";
			data.actionID = "<!--{$smarty_data['actionID']}-->";			
			var postData = 'parm=' + encodeURIComponent(escape(JSON.stringify(data)));									
			$.ajax({
				type:"POST",
				url:"/ajax/grid/delete",
				data: postData,
				cache: false,
				success: function(data){					
					alert(data);
					window.location.href="<!--{$smarty_data['premission']['ActionURL']}-->";					
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){						
					alert(textStatus);						
				}
			});					
			
			event.preventDefault();
			return false; 
		});
		
		
	});	
</script>
		
	
	<!--{if $smarty_data['premission']['Create']}-->
<h3><a href="<!--{$smarty_data['premission']['ActionURL']}-->/add">Downloads Add</a></h3>
<!--{/if}-->
<div>Total : <!--{$smarty_data['total_rows']}--></div>
	<form method="post" action="<!--{$smarty_data['premission']['ActionURL']}-->" id="form-search">
		<table border=1>		
			<tr>
		<!--{foreach name=downloadslist from=$smarty_data['header'] item=value}-->
				<!--{if $value['Search']}-->				
					<th width="<!--{$value['FieldName']}--><!--{$value['DisplaySizeType']}-->"><input type='text' id='search_<!--{$value['FieldName']|lower}-->' name='search_<!--{$value['FieldName']|lower}-->' value="<!--{$smarty_data['searchinfo'][$value['FieldName']|lower]}-->"></th>
				<!--{else}-->					
					<th></th>
				<!--{/if}-->
		<!--{/foreach}-->			
				<th><input type="submit" id="btn_search" namd="btn_search" value="Search"></th>
			</tr>
			<tr>
		<!--{foreach name=downloadslist from=$smarty_data['header'] item=value}-->
				<th width="<!--{$value['DisplaySize']}--><!--{$value['DisplaySizeType']}-->"><!--{$value['DisplayName']}--></th>
		<!--{/foreach}-->		
				<th>Actions</th>		
			</tr>
		<!--{foreach name=downloadslist from=$smarty_data['downloadslist'] item=value}-->
			<tr>						
			<!--{foreach name=downloadslist from=$smarty_data['header'] item=fieldvalue}-->
				<!--{if $fieldvalue['FieldType']=='text'}-->				
					<td><!--{$value[$fieldvalue['FieldName']]}--></td>
				<!--{elseif $fieldvalue['FieldType']=='image'}-->					
					<td><img src="<!--{$value[$fieldvalue['FieldName']]}-->"></td>
				<!--{/if}-->							
			<!--{/foreach}-->				
					<td>
			<!--{if $smarty_data['premission']['Read']}-->
				<!--{if $smarty_data['premission']['Modify']}-->
					<a href="<!--{$smarty_data['premission']['ActionURL']}-->/edit/<!--{$value['ID']}-->">EDIT</a>
				<!--{else}-->
					<a href="<!--{$smarty_data['premission']['ActionURL']}-->/read/<!--{$value['ID']}-->">READ</a>
				<!--{/if}-->				
			<!--{/if}-->
			<!--{if $smarty_data['premission']['Delete']}-->					
					<a href="#" class="grid_delete" id="grid_delete_<!--{$value['ID']}-->">DELETE</a>
			<!--{/if}-->
					</td>
			</tr>
		<!--{/foreach}-->
		</table>
	</form>
<!--{$smarty_data['pagination']}-->