<!--{extends file='layout_admin.tpl'}-->

<!--{block name="title"}--><!--{/block}-->

<!--{block name="header"}-->
<style>
.addr, .addr tr, .addr td{
	border:0px;
	padding : 0.1em;
}
}
</style>
<!--{/block}-->

<!--{block name="body"}--> class="tm tl ceo"<!--{/block}-->

<!--{block name="contentwrapper"}-->

	<section id="survey-header">
		<div class="g__wrap">
			<div class="g__wrap-2">
				<div class="g cf g__collapse-custom">
					<div class="g__item g__one-col"></div>
					<div class="g__item g__ten-col">
						<p class="align-center"><img src="/images/rs/logo.png" alt="MDB"></p>
					</div>
				</div>
			</div>
		</div>
		
		<div id="logout"><a href="/portal/logout">Logout</a></div>
	</section>

	<section id="survey-results">	
		<div class="g__wrap">
			<div class="g__wrap-2">
				<div class="g cf g__collapse-custom" id="buttons">
					<div class="g__item g__one-col"></div>
					<div class="g__item g__five-col">							
						<div id="export">	
							<h4>Export Submissions</h4>
							<small>
								<form action="/portal/export" method="post" id="export-all">	
									<input type="submit" class="submit" value="All records">
								</form>
								<form action="/portal/export" method="post" id="export-filtered">
									<!-- If a filter is applied, IDs to be exported will go into <input name="records[]"> -->
									<input type="submit" class="submit" value="Filtered records" disabled>
								</form>
								<form action="/portal/export" method="post" id="export-selected">
									<!-- If rows are selected, IDs to be exported will go into <input name="records[]"> -->
									<input type="submit" class="submit" value="Selected records" disabled>
								</form>
							</small>
						</div>
					</div>
					<div class="g__item g__five-col">						
						<div id="hide">	
							<h4>Remove Submissions</h4>
							<small>
								<form action="/portal/remove" method="post" id="hide-all">	
									<input type="submit" class="submit" value="All records">
								</form>
								<form action="/portal/remove" method="post" id="hide-filtered">
									<!-- If a filter is applied, IDs to be hidden will go into <input name="records[]"> -->
									<input type="submit" class="submit" value="Filtered records" disabled>
								</form>
								<form action="/portal/remove" method="post" id="hide-selected">
									<!-- If rows are selected, IDs to be hidden will go into <input name="records[]"> -->
									<input type="submit" class="submit" value="Selected records" disabled>
								</form>
							</small>
						</div>
					</div>
				</div>
				<div class="g cf g__collapse-custom">
					<div class="g__item g__one-col"></div>
					<div class="g__item g__ten-col">
					<form>
					<input name="test" id="test" class="input--name" data-validation="required" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50" value="test">
					</form>
					<form>
					<input name="test" id="test" class="input--name" data-validation="required" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50" value="test">
					</form>
						<table id="datatable" class="display">
							<thead>
								<tr>
									<th>#</th>
									<th>Date</th>
									<th>Cust no.</th>
									<th>Address</th>
								</tr>
							</thead>
							<tbody id="survey-form">								
<!-- for each submission -->
								<!--{foreach from=$smarty_data['surveys'] item=survey}-->								
								<tr><!-- id -->
									<td><!--{$survey.ID}--></td>
									<td><!--{$survey.Date}--></td><!-- submissions date -->
									<td><!--{$survey.CustNo}--></td><!-- customer number -->
									<td>										
										<a href="/portal/edit/<!--{$survey.ID}-->"><!--{$survey.Addresses|@count}--> <!--{if $survey.Addresses|@count > 1}-->Addresses<!--{else}-->Address<!--{/if}--></a>
									</td>
								</tr>
								<!--{/foreach}-->
								<!-- /for each submission -->								
								
							</tbody>
						</table>
						
						<div id="dialog" class="is-hidden"></div>
						
					</div>
				</div>
			</div>
		</div>
	</section>

<!--{/block}-->