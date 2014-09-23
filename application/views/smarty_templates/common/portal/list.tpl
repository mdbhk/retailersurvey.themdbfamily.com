<!--{extends file='layout.tpl'}-->

<!--{block name="title"}--><!--{/block}-->

<!--{block name="header"}--><!--{/block}-->

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
						<table id="datatable" class="display">
							<thead>
								<tr>
									<th>#</th>
									<th>Date</th>
									<th>Cust no.</th>
									<th>Address</th>
								</tr>
							</thead>
							<tbody>
								<!-- for each submission -->
								<!--{foreach from=$smarty_data['surveys'] item=survey}-->
								<tr><!-- id -->
									<td><!--{$survey.ID}--></td>
									<td><!--{$survey.Date}--></td><!-- submissions date -->
									<td><!--{$survey.CustNo}--></td><!-- customer number -->
									<td>										
										<a href="#" class="popup"><!--{$survey.Addresses|@count}--> <!--{if $survey.Addresses|@count > 1}-->Addresses<!--{else}-->Address<!--{/if}--></a>
										<div class="popup-address is-hidden">
											<table>
												<tr>
													<th>Address</th>
													<th>Ship-to</th>
													<th>Store</th>
												</tr>
												<!-- for each address -->
												<!--{foreach from=$survey.Addresses item=address}-->
												<tr>
													<td>
														<b><!--{$address.Name}--></b><br>
														<!--{$address.Address}--><br>
														<!--{if $address.Address2}-->
														<!--{$address.Address2}--><br>
														<!--{/if}-->
														<!--{$address.City}-->, <!--{$address.State}--> <!--{$address.Zip}--><br>
														Tel: <!--{$address.Phone}-->
													</td>
													<td>
														<input type="checkbox" <!--{if $address.isShipTo}-->checked<!--{/if}--> disabled><!-- check if ship-to -->
													</td>
													<td>
														<input type="checkbox" <!--{if $address.isStore}-->checked<!--{/if}--> disabled><!-- check if store -->
													</td>
												</tr>
												<!--{/foreach}-->
												<!-- /for each address -->
											</table>
										</div>											
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