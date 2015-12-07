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
						<p><b>Dear valued retailer,</b></p>
						<p>We want to help interested consumers find their way to your stores. In an effort to improve our store locators, we're asking that you help fill in your current address details below.</p>
						<p>This is a one-time survey. To make future updates to your address, please contact your account specialist.</p>	
						<p>With thanks,<br>The MDB Family</p>
					</div>
				</div>
			</div>
		</div>
	</section>
						
	<section id="survey-form">
		<div class="g__wrap">
			<div class="g__wrap-2">
				<div class="g cf g__collapse-custom">
					<div class="g__item g__one-col"></div>
					<div class="g__item g__ten-col">
					
						<div class="message valid"><b>Success!</b> Thank you for sending us your details, your information has been saved.<br><br>To make future address updates, please contact your account specialist.</div>
					
							<fieldset>						
								<div class="legend">
									<h4>General Information</h4>
								</div>													
								<div class="field">			
									<div>
										<label for="custno">Your MDB customer number:
										<b>Required. Find on your invoices, or by contacting your account specialist </b></label>
										<span class="response"><!--{$smarty_data['Data']['custno']}--></span>
									</div>
									<div>
										<label for="website">Website <em>(optional)</em></label>
										<span class="response"><!--{$smarty_data['Data']['website']}--></span>	
									</div>
									<div>
										<label for="email">Email</em></label>
										<span class="response"><!--{$smarty_data['Data']['email']}--></span>	
									</div>
								</div>
							</fieldset>
							
							<!--{for $index=1 to $smarty_data['RData']|@count}-->
							<!--{assign var=key value="address$index"}-->
							<fieldset>		
								<div class="legend">
									<h4>Address #<!--{$index}--><span></span></h4>
								</div>	
											
								<div class="field">		
									<label>Address type:</label>
									<span class="response">
									<!--{if $smarty_data['RData'][$key]['is-ship-to'] && $smarty_data['RData'][$key]['is-store']}-->
										Ship-to address<br>Store address
										<!--{elseif $smarty_data['RData'][$key]['is-ship-to']}-->
										Ship-to address
										<!--{elseif $smarty_data['RData'][$key]['is-store']}-->
										Store address
									<!--{/if}-->
									</span>
								</div>	
														
								<div class="field">	
									<div class="name">
										<label for="name_1">Ship-to/store name</label>
										<span class="response"><!--{$smarty_data['RData'][$key]['name']}--></span>
									</div>	
									<div>
										<label for="country_1">Country</label>
										<span class="response">
										<!--{if $smarty_data['Data'][$key]['country'] == 'DZ'}-->Algeria<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AR'}-->Argentina<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AW'}-->Aruba<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AU'}-->Australia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AT'}-->Austria<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BS'}-->Bahamas<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BH'}-->Bahrain<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BB'}-->Barbados<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BE'}-->Belgium<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BM'}-->Bermuda<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BR'}-->Brazil<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BN'}-->Brunei Darussalam<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'BG'}-->Bulgaria<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'CA'}-->Canada<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'CN'}-->China<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'HR'}-->Croatia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'CY'}-->Cyprus<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'CZ'}-->Czech Republic<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'DK'}-->Denmark<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'DR'}-->DOMINICAN REPUBLIC<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'EC'}-->Ecuador<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'EE'}-->Estonia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'FJ'}-->Fiji Islands<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'FI'}-->Finland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'FR'}-->France<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'DE'}-->Germany<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'GB'}-->Great Britain<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'EL'}-->Greece<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'HK'}-->Hong Kong<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'HU'}-->Hungary<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'IS'}-->Iceland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'IN'}-->India<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'ID'}-->Indonesia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'IE'}-->Ireland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'IT'}-->Italy<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'JP'}-->Japan<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'KE'}-->Kenya<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'LV'}-->Latvia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'LT'}-->Lithuania<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'LU'}-->Luxembourg<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'MY'}-->Malaysia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'MT'}-->Malta<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'MX'}-->Mexico<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'ME'}-->Montenegro<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'MO'}-->Morocco<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'MZ'}-->Mozambique<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'NL'}-->Netherlands<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AN'}-->Netherlands Antilles<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'NZ'}-->New Zealand<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'NG'}-->Nigeria<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'NO'}-->Norway<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'PA'}-->Panama<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'PH'}-->Philippines<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'PL'}-->Poland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'PT'}-->Portugal<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'PR'}-->Puerto Rico<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'RO'}-->Romania<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'RU'}-->Russia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'WS'}-->Samoa<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SA'}-->Saudi Arabia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'RS'}-->Serbia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SG'}-->Singapore<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SK'}-->Slovakia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SI'}-->Slovenia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SB'}-->Solomon Islands<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'ZA'}-->South Africa<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'ES'}-->Spain<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SZ'}-->Swaziland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'SE'}-->Sweden<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'CH'}-->Switzerland<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'TW'}-->Taiwan<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'TZ'}-->Tanzania<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'TH'}-->Thailand<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'TN'}-->Tunisia<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'TR'}-->Turkey<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'UG'}-->Uganda<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'AE'}-->United Arab Emirates<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'UK'}-->United Kingdom<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'US'}-->United State<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'VU'}-->Vanuatu<!--{/if}-->
										<!--{if $smarty_data['Data'][$key]['country'] == 'VE'}-->Venezuela<!--{/if}-->
										</span>
									</div>					
									<div>
										<label for="address_1">Address</label>
										<span class="response"><!--{$smarty_data['RData'][$key]['address']}--></span>
									</div>									
									<div>
										<label for="address2_1">Address 2 <em>(optional)</em></label>
										<span class="response"><!--{$smarty_data['RData'][$key]['address2']}--></span>
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_1">City</label>
											<span class="response"><!--{$smarty_data['RData'][$key]['city']}--></span>
										</div>	
										<div class="c__item third">
											<label for="state_1">State</label>
											<span class="response"><!--{$smarty_data['RData'][$key]['state']}--></span>		
										</div>										
										<div class="c__item third">
											<label for="zip_1">ZIP</label>
											<span class="response"><!--{$smarty_data['RData'][$key]['zip']}--></span>
										</div>
									</div>	
									<div>
										<label for="phone_1">Phone</label>
										<span class="response"><!--{$smarty_data['RData'][$key]['phone']}--></span>
									</div>		
								</div>
							</fieldset><!-- end address-<!--{$index}-->-->
							<!--{/for}-->
							
					</div>
				</div>
			</div>
		</div>
	</section>

<!--{/block}-->