<!--{if $smarty_data['message']['show']}-->
<div id="message" class="<!--{if $smarty_data['message']['method'] == 1}-->colorbox<!--{/if}-->" href="#message #message_content">
<div id="message_content">
<h1><!--{$smarty_data['message']['title']}--></h1>
<p><!--{$smarty_data['message']['content']}--><p>
</div>
</div>
<script>
	$("#message.colorbox").colorbox({
		open: true,
		inline: true
	});
	
	function show_message()
	{
		$("#message.colorbox").click();
	}
</script>
<!--{/if}-->