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
						<form action="/survey/post" method="post">
						
							<div class="message error"><b>Error:</b><!--{if $smarty_data['Error'] && isset($smarty_data['Message'])}--><!--{$smarty_data['Message']}--><!--{else}-->Your information could not be saved due to the below issues. Please correct and try again.<!--{/if}--></div>
						
							<fieldset>						
								<div class="legend">
									<h4>General Information</h4>
								</div>													
								<div class="field">			
									<div>
										<label for="custno">Your MDB customer number:
										<b>Required. Find on your invoices, or by contacting your account specialist </b></label>
										<input type="text" name="custno" id="custno" data-validation="required" data-validation-error-msg="Please enter your customer number" data-validation-length="max20" <!--{if isset($smarty_data['Data']['custno'])}-->value="<!--{$smarty_data['Data']['custno']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors']['custno']['status'])}-->
										<span class="help-block form-error"><!--{$smarty_data['Errors']['custno']['message']}--></span>
										<!--{/if}-->
									</div>
									<div id="custno-result"></div>	
									<div>
										<label for="website">Website <em>(optional)</em></label>
										<input type="text" name="website" id="website" data-validation-optional="true" data-validation="url" data-validation-error-msg="Please enter a valid URL in the format http://www.domain.com" <!--{if isset($smarty_data['Data']['website'])}-->value="<!--{$smarty_data['Data']['website']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors']['website']['status'])}-->
										<span class="help-block form-error"><!--{$smarty_data['Errors']['website']['message']}--></span>
										<!--{/if}-->
									</div>		
									<div>
										<label for="email">Email</label>
										<input type="text" name="email" id="email" data-validation="required" data-validation="email" data-validation-error-msg="Please enter a valid email address" <!--{if isset($smarty_data['Data']['email'])}-->value="<!--{$smarty_data['Data']['email']}-->"<!--{/if}-->>	
										<!--{if isset($smarty_data['Errors']['email']['status'])}-->
										<span class="help-block form-error"><!--{$smarty_data['Errors']['email']['message']}--></span>
										<!--{/if}-->
									</div>
									<div style="height: 5px;">&nbsp;</div>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="subscribe">
												<div class="checkbox-wrap__input"><input type="checkbox" id="subscribe" name="subscribe" class="input--subscribe" value="subscribe"></div>
												<div class="checkbox-wrap__label">
													Subscribe to our newsletter
												</div>
												</label>
											</div>										
										</div>	
									</div>								
								</div>
							</fieldset>
							
							<fieldset class="address address--1">		
								<div class="legend">
									<h4>Address #1<span></span></h4>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
											
								<div class="field">		
									<label>Address type: <b>Select one or both</b></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap <!--{if $smarty_data['Data']['address1']['is-ship-to']}-->selected<!--{/if}-->">
												<label for="is-ship-to_1">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_1" name="is-ship-to_1" class="input--is-ship-to" value="is-ship-to" data-validation="has-store-type" data-validation-error-msg="Please select at least one" <!--{if $smarty_data['Data']['address1']['is-ship-to']}-->checked="checked"<!--{/if}-->></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap <!--{if $smarty_data['Data']['address1']['is-store']}-->selected<!--{/if}-->">
												<label for="is-store_1">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_1" name="is-store_1" class="input--is-store" value="is-store" data-validation="has-store-type" data-validation-error-msg="Please select at least one" <!--{if $smarty_data['Data']['address1']['is-store']}-->checked="checked"<!--{/if}-->></div>
												<div class="checkbox-wrap__label">
													Store address
												</div>
												</label>
											</div>
										</div>	
									</div>														
								</div>	
								
								<div class="field">	
									<div class="name">
										<label for="name_1">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_1" id="name_1" class="input--name" data-validation="required" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50" <!--{if isset($smarty_data['Data']['address1']['name'])}-->value="<!--{$smarty_data['Data']['address1']['name']}-->"<!--{/if}-->>		
										<!--{if isset($smarty_data['Errors']['address1']['name']['status']) || (!isset($smarty_data['Errors']['address1']['name']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors']['address1']['name'])}-->
											<!--{$smarty_data['Errors']['address1']['name']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>	
									<div>
										<label for="country_1">Country</label>
										<select name="country_1" id="country_1" class="input--country" data-validation="required" data-validation-error-msg="Please enter your country">		
											<option value="DZ" <!--{if $smarty_data['Data']['address1']['country'] == 'DZ'}-->selected="selected"<!--{/if}-->>Algeria</option>
											<option value="AR" <!--{if $smarty_data['Data']['address1']['country'] == 'AR'}-->selected="selected"<!--{/if}-->>Argentina</option>
											<option value="AW" <!--{if $smarty_data['Data']['address1']['country'] == 'AW'}-->selected="selected"<!--{/if}-->>Aruba</option>
											<option value="AU" <!--{if $smarty_data['Data']['address1']['country'] == 'AU'}-->selected="selected"<!--{/if}-->>Australia</option>
											<option value="AT" <!--{if $smarty_data['Data']['address1']['country'] == 'AT'}-->selected="selected"<!--{/if}-->>Austria</option>
											<option value="BS" <!--{if $smarty_data['Data']['address1']['country'] == 'BS'}-->selected="selected"<!--{/if}-->>Bahamas</option>
											<option value="BH" <!--{if $smarty_data['Data']['address1']['country'] == 'BH'}-->selected="selected"<!--{/if}-->>Bahrain</option>
											<option value="BB" <!--{if $smarty_data['Data']['address1']['country'] == 'BB'}-->selected="selected"<!--{/if}-->>Barbados</option>
											<option value="BE" <!--{if $smarty_data['Data']['address1']['country'] == 'BE'}-->selected="selected"<!--{/if}-->>Belgium</option>
											<option value="BM" <!--{if $smarty_data['Data']['address1']['country'] == 'BM'}-->selected="selected"<!--{/if}-->>Bermuda</option>
											<option value="BR" <!--{if $smarty_data['Data']['address1']['country'] == 'BR'}-->selected="selected"<!--{/if}-->>Brazil</option>
											<option value="BN" <!--{if $smarty_data['Data']['address1']['country'] == 'BN'}-->selected="selected"<!--{/if}-->>Brunei Darussalam</option>
											<option value="BG" <!--{if $smarty_data['Data']['address1']['country'] == 'BG'}-->selected="selected"<!--{/if}-->>Bulgaria</option>
											<option value="CA" <!--{if $smarty_data['Data']['address1']['country'] == 'CA'}-->selected="selected"<!--{/if}-->>Canada</option>
											<option value="CN" <!--{if $smarty_data['Data']['address1']['country'] == 'CN'}-->selected="selected"<!--{/if}-->>China</option>
											<option value="HR" <!--{if $smarty_data['Data']['address1']['country'] == 'HR'}-->selected="selected"<!--{/if}-->>Croatia</option>
											<option value="CY" <!--{if $smarty_data['Data']['address1']['country'] == 'CY'}-->selected="selected"<!--{/if}-->>Cyprus</option>
											<option value="CZ" <!--{if $smarty_data['Data']['address1']['country'] == 'CZ'}-->selected="selected"<!--{/if}-->>Czech Republic</option>
											<option value="DK" <!--{if $smarty_data['Data']['address1']['country'] == 'DK'}-->selected="selected"<!--{/if}-->>Denmark</option>
											<option value="DR" <!--{if $smarty_data['Data']['address1']['country'] == 'DR'}-->selected="selected"<!--{/if}-->>DOMINICAN REPUBLIC</option>
											<option value="EC" <!--{if $smarty_data['Data']['address1']['country'] == 'EC'}-->selected="selected"<!--{/if}-->>Ecuador</option>
											<option value="EE" <!--{if $smarty_data['Data']['address1']['country'] == 'EE'}-->selected="selected"<!--{/if}-->>Estonia</option>
											<option value="FJ" <!--{if $smarty_data['Data']['address1']['country'] == 'FJ'}-->selected="selected"<!--{/if}-->>Fiji Islands</option>
											<option value="FI" <!--{if $smarty_data['Data']['address1']['country'] == 'FI'}-->selected="selected"<!--{/if}-->>Finland</option>
											<option value="FR" <!--{if $smarty_data['Data']['address1']['country'] == 'FR'}-->selected="selected"<!--{/if}-->>France</option>
											<option value="DE" <!--{if $smarty_data['Data']['address1']['country'] == 'DE'}-->selected="selected"<!--{/if}-->>Germany</option>
											<option value="GB" <!--{if $smarty_data['Data']['address1']['country'] == 'GB'}-->selected="selected"<!--{/if}-->>Great Britain</option>
											<option value="EL" <!--{if $smarty_data['Data']['address1']['country'] == 'EL'}-->selected="selected"<!--{/if}-->>Greece</option>
											<option value="HK" <!--{if $smarty_data['Data']['address1']['country'] == 'HK'}-->selected="selected"<!--{/if}-->>Hong Kong</option>
											<option value="HU" <!--{if $smarty_data['Data']['address1']['country'] == 'HU'}-->selected="selected"<!--{/if}-->>Hungary</option>
											<option value="IS" <!--{if $smarty_data['Data']['address1']['country'] == 'IS'}-->selected="selected"<!--{/if}-->>Iceland</option>
											<option value="IN" <!--{if $smarty_data['Data']['address1']['country'] == 'IN'}-->selected="selected"<!--{/if}-->>India</option>
											<option value="ID" <!--{if $smarty_data['Data']['address1']['country'] == 'ID'}-->selected="selected"<!--{/if}-->>Indonesia</option>
											<option value="IE" <!--{if $smarty_data['Data']['address1']['country'] == 'IE'}-->selected="selected"<!--{/if}-->>Ireland</option>
											<option value="IT" <!--{if $smarty_data['Data']['address1']['country'] == 'IT'}-->selected="selected"<!--{/if}-->>Italy</option>
											<option value="JP" <!--{if $smarty_data['Data']['address1']['country'] == 'JP'}-->selected="selected"<!--{/if}-->>Japan</option>
											<option value="KE" <!--{if $smarty_data['Data']['address1']['country'] == 'KE'}-->selected="selected"<!--{/if}-->>Kenya</option>
											<option value="LV" <!--{if $smarty_data['Data']['address1']['country'] == 'LV'}-->selected="selected"<!--{/if}-->>Latvia</option>
											<option value="LT" <!--{if $smarty_data['Data']['address1']['country'] == 'LT'}-->selected="selected"<!--{/if}-->>Lithuania</option>
											<option value="LU" <!--{if $smarty_data['Data']['address1']['country'] == 'LU'}-->selected="selected"<!--{/if}-->>Luxembourg</option>
											<option value="MY" <!--{if $smarty_data['Data']['address1']['country'] == 'MY'}-->selected="selected"<!--{/if}-->>Malaysia</option>
											<option value="MT" <!--{if $smarty_data['Data']['address1']['country'] == 'MT'}-->selected="selected"<!--{/if}-->>Malta</option>
											<option value="MX" <!--{if $smarty_data['Data']['address1']['country'] == 'MX'}-->selected="selected"<!--{/if}-->>Mexico</option>
											<option value="ME" <!--{if $smarty_data['Data']['address1']['country'] == 'ME'}-->selected="selected"<!--{/if}-->>Montenegro</option>
											<option value="MO" <!--{if $smarty_data['Data']['address1']['country'] == 'MO'}-->selected="selected"<!--{/if}-->>Morocco</option>
											<option value="MZ" <!--{if $smarty_data['Data']['address1']['country'] == 'MZ'}-->selected="selected"<!--{/if}-->>Mozambique</option>
											<option value="NL" <!--{if $smarty_data['Data']['address1']['country'] == 'NL'}-->selected="selected"<!--{/if}-->>Netherlands</option>
											<option value="AN" <!--{if $smarty_data['Data']['address1']['country'] == 'AN'}-->selected="selected"<!--{/if}-->>Netherlands Antilles</option>
											<option value="NZ" <!--{if $smarty_data['Data']['address1']['country'] == 'NZ'}-->selected="selected"<!--{/if}-->>New Zealand</option>
											<option value="NG" <!--{if $smarty_data['Data']['address1']['country'] == 'NG'}-->selected="selected"<!--{/if}-->>Nigeria</option>
											<option value="NO" <!--{if $smarty_data['Data']['address1']['country'] == 'NO'}-->selected="selected"<!--{/if}-->>Norway</option>
											<option value="PA" <!--{if $smarty_data['Data']['address1']['country'] == 'PA'}-->selected="selected"<!--{/if}-->>Panama</option>
											<option value="PH" <!--{if $smarty_data['Data']['address1']['country'] == 'PH'}-->selected="selected"<!--{/if}-->>Philippines</option>
											<option value="PL" <!--{if $smarty_data['Data']['address1']['country'] == 'PL'}-->selected="selected"<!--{/if}-->>Poland</option>
											<option value="PT" <!--{if $smarty_data['Data']['address1']['country'] == 'PT'}-->selected="selected"<!--{/if}-->>Portugal</option>
											<option value="PR" <!--{if $smarty_data['Data']['address1']['country'] == 'PR'}-->selected="selected"<!--{/if}-->>Puerto Rico</option>
											<option value="RO" <!--{if $smarty_data['Data']['address1']['country'] == 'RO'}-->selected="selected"<!--{/if}-->>Romania</option>
											<option value="RU" <!--{if $smarty_data['Data']['address1']['country'] == 'RU'}-->selected="selected"<!--{/if}-->>Russia</option>
											<option value="WS" <!--{if $smarty_data['Data']['address1']['country'] == 'WS'}-->selected="selected"<!--{/if}-->>Samoa</option>
											<option value="SA" <!--{if $smarty_data['Data']['address1']['country'] == 'SA'}-->selected="selected"<!--{/if}-->>Saudi Arabia</option>
											<option value="RS" <!--{if $smarty_data['Data']['address1']['country'] == 'RS'}-->selected="selected"<!--{/if}-->>Serbia</option>
											<option value="SG" <!--{if $smarty_data['Data']['address1']['country'] == 'SG'}-->selected="selected"<!--{/if}-->>Singapore</option>
											<option value="SK" <!--{if $smarty_data['Data']['address1']['country'] == 'SK'}-->selected="selected"<!--{/if}-->>Slovakia</option>
											<option value="SI" <!--{if $smarty_data['Data']['address1']['country'] == 'SI'}-->selected="selected"<!--{/if}-->>Slovenia</option>
											<option value="SB" <!--{if $smarty_data['Data']['address1']['country'] == 'SB'}-->selected="selected"<!--{/if}-->>Solomon Islands</option>
											<option value="ZA" <!--{if $smarty_data['Data']['address1']['country'] == 'ZA'}-->selected="selected"<!--{/if}-->>South Africa</option>
											<option value="ES" <!--{if $smarty_data['Data']['address1']['country'] == 'ES'}-->selected="selected"<!--{/if}-->>Spain</option>
											<option value="SZ" <!--{if $smarty_data['Data']['address1']['country'] == 'SZ'}-->selected="selected"<!--{/if}-->>Swaziland</option>
											<option value="SE" <!--{if $smarty_data['Data']['address1']['country'] == 'SE'}-->selected="selected"<!--{/if}-->>Sweden</option>
											<option value="CH" <!--{if $smarty_data['Data']['address1']['country'] == 'CH'}-->selected="selected"<!--{/if}-->>Switzerland</option>
											<option value="TW" <!--{if $smarty_data['Data']['address1']['country'] == 'TW'}-->selected="selected"<!--{/if}-->>Taiwan</option>
											<option value="TZ" <!--{if $smarty_data['Data']['address1']['country'] == 'TZ'}-->selected="selected"<!--{/if}-->>Tanzania</option>
											<option value="TH" <!--{if $smarty_data['Data']['address1']['country'] == 'TH'}-->selected="selected"<!--{/if}-->>Thailand</option>
											<option value="TN" <!--{if $smarty_data['Data']['address1']['country'] == 'TN'}-->selected="selected"<!--{/if}-->>Tunisia</option>
											<option value="TR" <!--{if $smarty_data['Data']['address1']['country'] == 'TR'}-->selected="selected"<!--{/if}-->>Turkey</option>
											<option value="UG" <!--{if $smarty_data['Data']['address1']['country'] == 'UG'}-->selected="selected"<!--{/if}-->>Uganda</option>
											<option value="AE" <!--{if $smarty_data['Data']['address1']['country'] == 'AE'}-->selected="selected"<!--{/if}-->>United Arab Emirates</option>
											<option value="UK" <!--{if $smarty_data['Data']['address1']['country'] == 'UK'}-->selected="selected"<!--{/if}-->>United Kingdom</option>
											<option value="US" <!--{if $smarty_data['Data']['address1']['country'] == 'US' || $smarty_data['Data']['address']['country'] == ''}-->selected="selected"<!--{/if}-->>USA</option>
											<option value="VU" <!--{if $smarty_data['Data']['address1']['country'] == 'VU'}-->selected="selected"<!--{/if}-->>Vanuatu</option>
											<option value="VE" <!--{if $smarty_data['Data']['address1']['country'] == 'VE'}-->selected="selected"<!--{/if}-->>Venezuela</option>
										</select>
										<!--{if isset($smarty_data['Errors']['address1']['country']['status']) || (!isset($smarty_data['Errors']['address1']['country']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors']['address1']['country'])}-->
											<!--{$smarty_data['Errors']['address1']['country']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>					
									<div>
										<label for="address_1">Address</label>
										<input type="text" name="address_1" id="address_1" class="input--address" data-validation="required" data-validation-error-msg="Please enter your street address" data-validation-length="max55" <!--{if isset($smarty_data['Data']['address1']['address'])}-->value="<!--{$smarty_data['Data']['address1']['address']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors']['address1']['address']) || (!isset($smarty_data['Errors']['address1']['address']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors']['address1']['address'])}-->
											<!--{$smarty_data['Errors']['address1']['address']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>									
									<div>
										<label for="address2_1">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_1" id="address2_1" class="input--address2" data-validation-length="max55" <!--{if isset($smarty_data['Data']['address1']['address2'])}-->value="<!--{$smarty_data['Data']['address1']['address2']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors']['address1']['address2']) || (!isset($smarty_data['Errors']['address1']['address2']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors']['address1']['address2'])}-->
											<!--{$smarty_data['Errors']['address1']['address2']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_1">City</label>
											<input type="text" name="city_1" id="city_1" class="input--city" data-validation="required" data-validation-error-msg="Please enter your city" data-validation-length="max30" <!--{if isset($smarty_data['Data']['address1']['city'])}-->value="<!--{$smarty_data['Data']['address1']['city']}-->"<!--{/if}-->>
											<!--{if isset($smarty_data['Errors']['address1']['city']) || (!isset($smarty_data['Errors']['address1']['city']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors']['address1']['city'])}-->
												<!--{$smarty_data['Errors']['address1']['city']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>	
										<div class="c__item third">
											<label for="state_1">State</label>
											<input type="text" name="state_1" id="state_1" class="input--state" data-validation="required customstate" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY" <!--{if isset($smarty_data['Data']['address1']['state'])}-->value="<!--{$smarty_data['Data']['address1']['state']}-->"<!--{/if}-->>
											<!--{if isset($smarty_data['Errors']['address1']['state']['status']) || (!isset($smarty_data['Errors']['address1']['state']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors']['address1']['state'])}-->
												<!--{$smarty_data['Errors']['address1']['state']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>										
										<div class="c__item third">
											<label for="zip_1">ZIP</label>
											<input type="text" name="zip_1" id="zip_1" class="input--zip" data-validation="required customzip" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20" <!--{if isset($smarty_data['Data']['address1']['zip'])}-->value="<!--{$smarty_data['Data']['address1']['zip']}-->"<!--{/if}-->>	
											<!--{if isset($smarty_data['Errors']['address1']['zip']['status']) || (!isset($smarty_data['Errors']['address1']['zip']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors']['address1']['zip'])}-->
												<!--{$smarty_data['Errors']['address1']['zip']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>
									</div>	
									<div>
										<label for="phone_1">Phone</label>
										<input type="text" name="phone_1" id="phone_1" class="input--phone" data-validation="required phone" data-validation-error-msg="Please enter your phone number" data-validation-length="max30" <!--{if isset($smarty_data['Data']['address1']['phone'])}-->value="<!--{$smarty_data['Data']['address1']['phone']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors']['address1']['phone']['status']) || (!isset($smarty_data['Errors']['address1']['phone']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors']['address1']['phone'])}-->
											<!--{$smarty_data['Errors']['address1']['phone']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>		
								</div>
							</fieldset><!-- end address-1-->
							
							<!--{section name=address start=2 loop=11 step=1}-->
							<!--{assign var=key value="address<!--{$smarty.section.address.index}-->"}-->
							<fieldset class="address address--<!--{$smarty.section.address.index}-->">		
								<div class="legend">
									<h4>Address #<!--{$smarty.section.address.index}--><span></span></h4>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-<!--{$smarty.section.address.index}-->" name="address-<!--{$smarty.section.address.index}-->">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap <!--{if $smarty_data['Data'][$key]['is-ship-to']}-->selected<!--{/if}-->">
												<label for="is-ship-to_<!--{$smarty.section.address.index}-->">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_<!--{$smarty.section.address.index}-->" name="is-ship-to_<!--{$smarty.section.address.index}-->" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one" <!--{if $smarty_data['Data'][$key]['is-ship-to']}-->checked="checked"<!--{/if}-->></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap" <!--{if $smarty_data['Data'][$key]['is-store']}-->selected<!--{/if}-->">
												<label for="is-store_<!--{$smarty.section.address.index}-->">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_<!--{$smarty.section.address.index}-->" name="is-store_<!--{$smarty.section.address.index}-->" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one" <!--{if $smarty_data['Data'][$key]['is-store']}-->checked="checked"<!--{/if}-->></div>
												<div class="checkbox-wrap__label">
													Store address
												</div>
												</label>
											</div>
										</div>	
									</div>														
								</div>	
														
								<div class="field">							
									<div class="name">
										<label for="name_<!--{$smarty.section.address.index}-->">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_<!--{$smarty.section.address.index}-->" id="name_<!--{$smarty.section.address.index}-->" class="input--name" data-validation="required" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50" <!--{if isset($smarty_data['Data'][$key]['name'])}-->value="<!--{$smarty_data['Data'][$key]['name']}-->"<!--{/if}-->>	
										<!--{if isset($smarty_data['Errors'][$key]['name']['status']) || (!isset($smarty_data['Errors'][$key]['name']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors'][$key]['name'])}-->
											<!--{$smarty_data['Errors'][$key]['name']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>			
									<div>
										<label for="country_<!--{$smarty.section.address.index}-->">Country</label>
										<select name="country_<!--{$smarty.section.address.index}-->" id="country_<!--{$smarty.section.address.index}-->" class="input--country" data-validation="required" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your country
											<option value="DZ" <!--{if $smarty_data['Data'][$key]['country'] == 'DZ'}-->selected="selected"<!--{/if}-->>Algeria</option>
											<option value="AR" <!--{if $smarty_data['Data'][$key]['country'] == 'AR'}-->selected="selected"<!--{/if}-->>Argentina</option>
											<option value="AW" <!--{if $smarty_data['Data'][$key]['country'] == 'AW'}-->selected="selected"<!--{/if}-->>Aruba</option>
											<option value="AU" <!--{if $smarty_data['Data'][$key]['country'] == 'AU'}-->selected="selected"<!--{/if}-->>Australia</option>
											<option value="AT" <!--{if $smarty_data['Data'][$key]['country'] == 'AT'}-->selected="selected"<!--{/if}-->>Austria</option>
											<option value="BS" <!--{if $smarty_data['Data'][$key]['country'] == 'BS'}-->selected="selected"<!--{/if}-->>Bahamas</option>
											<option value="BH" <!--{if $smarty_data['Data'][$key]['country'] == 'BH'}-->selected="selected"<!--{/if}-->>Bahrain</option>
											<option value="BB" <!--{if $smarty_data['Data'][$key]['country'] == 'BB'}-->selected="selected"<!--{/if}-->>Barbados</option>
											<option value="BE" <!--{if $smarty_data['Data'][$key]['country'] == 'BE'}-->selected="selected"<!--{/if}-->>Belgium</option>
											<option value="BM" <!--{if $smarty_data['Data'][$key]['country'] == 'BM'}-->selected="selected"<!--{/if}-->>Bermuda</option>
											<option value="BR" <!--{if $smarty_data['Data'][$key]['country'] == 'BR'}-->selected="selected"<!--{/if}-->>Brazil</option>
											<option value="BN" <!--{if $smarty_data['Data'][$key]['country'] == 'BN'}-->selected="selected"<!--{/if}-->>Brunei Darussalam</option>
											<option value="BG" <!--{if $smarty_data['Data'][$key]['country'] == 'BG'}-->selected="selected"<!--{/if}-->>Bulgaria</option>
											<option value="CA" <!--{if $smarty_data['Data'][$key]['country'] == 'CA'}-->selected="selected"<!--{/if}-->>Canada</option>
											<option value="CN" <!--{if $smarty_data['Data'][$key]['country'] == 'CN'}-->selected="selected"<!--{/if}-->>China</option>
											<option value="HR" <!--{if $smarty_data['Data'][$key]['country'] == 'HR'}-->selected="selected"<!--{/if}-->>Croatia</option>
											<option value="CY" <!--{if $smarty_data['Data'][$key]['country'] == 'CY'}-->selected="selected"<!--{/if}-->>Cyprus</option>
											<option value="CZ" <!--{if $smarty_data['Data'][$key]['country'] == 'CZ'}-->selected="selected"<!--{/if}-->>Czech Republic</option>
											<option value="DK" <!--{if $smarty_data['Data'][$key]['country'] == 'DK'}-->selected="selected"<!--{/if}-->>Denmark</option>
											<option value="DR" <!--{if $smarty_data['Data'][$key]['country'] == 'DR'}-->selected="selected"<!--{/if}-->>DOMINICAN REPUBLIC</option>
											<option value="EC" <!--{if $smarty_data['Data'][$key]['country'] == 'EC'}-->selected="selected"<!--{/if}-->>Ecuador</option>
											<option value="EE" <!--{if $smarty_data['Data'][$key]['country'] == 'EE'}-->selected="selected"<!--{/if}-->>Estonia</option>
											<option value="FJ" <!--{if $smarty_data['Data'][$key]['country'] == 'FJ'}-->selected="selected"<!--{/if}-->>Fiji Islands</option>
											<option value="FI" <!--{if $smarty_data['Data'][$key]['country'] == 'FI'}-->selected="selected"<!--{/if}-->>Finland</option>
											<option value="FR" <!--{if $smarty_data['Data'][$key]['country'] == 'FR'}-->selected="selected"<!--{/if}-->>France</option>
											<option value="DE" <!--{if $smarty_data['Data'][$key]['country'] == 'DE'}-->selected="selected"<!--{/if}-->>Germany</option>
											<option value="GB" <!--{if $smarty_data['Data'][$key]['country'] == 'GB'}-->selected="selected"<!--{/if}-->>Great Britain</option>
											<option value="EL" <!--{if $smarty_data['Data'][$key]['country'] == 'EL'}-->selected="selected"<!--{/if}-->>Greece</option>
											<option value="HK" <!--{if $smarty_data['Data'][$key]['country'] == 'HK'}-->selected="selected"<!--{/if}-->>Hong Kong</option>
											<option value="HU" <!--{if $smarty_data['Data'][$key]['country'] == 'HU'}-->selected="selected"<!--{/if}-->>Hungary</option>
											<option value="IS" <!--{if $smarty_data['Data'][$key]['country'] == 'IS'}-->selected="selected"<!--{/if}-->>Iceland</option>
											<option value="IN" <!--{if $smarty_data['Data'][$key]['country'] == 'IN'}-->selected="selected"<!--{/if}-->>India</option>
											<option value="ID" <!--{if $smarty_data['Data'][$key]['country'] == 'ID'}-->selected="selected"<!--{/if}-->>Indonesia</option>
											<option value="IE" <!--{if $smarty_data['Data'][$key]['country'] == 'IE'}-->selected="selected"<!--{/if}-->>Ireland</option>
											<option value="IT" <!--{if $smarty_data['Data'][$key]['country'] == 'IT'}-->selected="selected"<!--{/if}-->>Italy</option>
											<option value="JP" <!--{if $smarty_data['Data'][$key]['country'] == 'JP'}-->selected="selected"<!--{/if}-->>Japan</option>
											<option value="KE" <!--{if $smarty_data['Data'][$key]['country'] == 'KE'}-->selected="selected"<!--{/if}-->>Kenya</option>
											<option value="LV" <!--{if $smarty_data['Data'][$key]['country'] == 'LV'}-->selected="selected"<!--{/if}-->>Latvia</option>
											<option value="LT" <!--{if $smarty_data['Data'][$key]['country'] == 'LT'}-->selected="selected"<!--{/if}-->>Lithuania</option>
											<option value="LU" <!--{if $smarty_data['Data'][$key]['country'] == 'LU'}-->selected="selected"<!--{/if}-->>Luxembourg</option>
											<option value="MY" <!--{if $smarty_data['Data'][$key]['country'] == 'MY'}-->selected="selected"<!--{/if}-->>Malaysia</option>
											<option value="MT" <!--{if $smarty_data['Data'][$key]['country'] == 'MT'}-->selected="selected"<!--{/if}-->>Malta</option>
											<option value="MX" <!--{if $smarty_data['Data'][$key]['country'] == 'MX'}-->selected="selected"<!--{/if}-->>Mexico</option>
											<option value="ME" <!--{if $smarty_data['Data'][$key]['country'] == 'ME'}-->selected="selected"<!--{/if}-->>Montenegro</option>
											<option value="MO" <!--{if $smarty_data['Data'][$key]['country'] == 'MO'}-->selected="selected"<!--{/if}-->>Morocco</option>
											<option value="MZ" <!--{if $smarty_data['Data'][$key]['country'] == 'MZ'}-->selected="selected"<!--{/if}-->>Mozambique</option>
											<option value="NL" <!--{if $smarty_data['Data'][$key]['country'] == 'NL'}-->selected="selected"<!--{/if}-->>Netherlands</option>
											<option value="AN" <!--{if $smarty_data['Data'][$key]['country'] == 'AN'}-->selected="selected"<!--{/if}-->>Netherlands Antilles</option>
											<option value="NZ" <!--{if $smarty_data['Data'][$key]['country'] == 'NZ'}-->selected="selected"<!--{/if}-->>New Zealand</option>
											<option value="NG" <!--{if $smarty_data['Data'][$key]['country'] == 'NG'}-->selected="selected"<!--{/if}-->>Nigeria</option>
											<option value="NO" <!--{if $smarty_data['Data'][$key]['country'] == 'NO'}-->selected="selected"<!--{/if}-->>Norway</option>
											<option value="PA" <!--{if $smarty_data['Data'][$key]['country'] == 'PA'}-->selected="selected"<!--{/if}-->>Panama</option>
											<option value="PH" <!--{if $smarty_data['Data'][$key]['country'] == 'PH'}-->selected="selected"<!--{/if}-->>Philippines</option>
											<option value="PL" <!--{if $smarty_data['Data'][$key]['country'] == 'PL'}-->selected="selected"<!--{/if}-->>Poland</option>
											<option value="PT" <!--{if $smarty_data['Data'][$key]['country'] == 'PT'}-->selected="selected"<!--{/if}-->>Portugal</option>
											<option value="PR" <!--{if $smarty_data['Data'][$key]['country'] == 'PR'}-->selected="selected"<!--{/if}-->>Puerto Rico</option>
											<option value="RO" <!--{if $smarty_data['Data'][$key]['country'] == 'RO'}-->selected="selected"<!--{/if}-->>Romania</option>
											<option value="RU" <!--{if $smarty_data['Data'][$key]['country'] == 'RU'}-->selected="selected"<!--{/if}-->>Russia</option>
											<option value="WS" <!--{if $smarty_data['Data'][$key]['country'] == 'WS'}-->selected="selected"<!--{/if}-->>Samoa</option>
											<option value="SA" <!--{if $smarty_data['Data'][$key]['country'] == 'SA'}-->selected="selected"<!--{/if}-->>Saudi Arabia</option>
											<option value="RS" <!--{if $smarty_data['Data'][$key]['country'] == 'RS'}-->selected="selected"<!--{/if}-->>Serbia</option>
											<option value="SG" <!--{if $smarty_data['Data'][$key]['country'] == 'SG'}-->selected="selected"<!--{/if}-->>Singapore</option>
											<option value="SK" <!--{if $smarty_data['Data'][$key]['country'] == 'SK'}-->selected="selected"<!--{/if}-->>Slovakia</option>
											<option value="SI" <!--{if $smarty_data['Data'][$key]['country'] == 'SI'}-->selected="selected"<!--{/if}-->>Slovenia</option>
											<option value="SB" <!--{if $smarty_data['Data'][$key]['country'] == 'SB'}-->selected="selected"<!--{/if}-->>Solomon Islands</option>
											<option value="ZA" <!--{if $smarty_data['Data'][$key]['country'] == 'ZA'}-->selected="selected"<!--{/if}-->>South Africa</option>
											<option value="ES" <!--{if $smarty_data['Data'][$key]['country'] == 'ES'}-->selected="selected"<!--{/if}-->>Spain</option>
											<option value="SZ" <!--{if $smarty_data['Data'][$key]['country'] == 'SZ'}-->selected="selected"<!--{/if}-->>Swaziland</option>
											<option value="SE" <!--{if $smarty_data['Data'][$key]['country'] == 'SE'}-->selected="selected"<!--{/if}-->>Sweden</option>
											<option value="CH" <!--{if $smarty_data['Data'][$key]['country'] == 'CH'}-->selected="selected"<!--{/if}-->>Switzerland</option>
											<option value="TW" <!--{if $smarty_data['Data'][$key]['country'] == 'TW'}-->selected="selected"<!--{/if}-->>Taiwan</option>
											<option value="TZ" <!--{if $smarty_data['Data'][$key]['country'] == 'TZ'}-->selected="selected"<!--{/if}-->>Tanzania</option>
											<option value="TH" <!--{if $smarty_data['Data'][$key]['country'] == 'TH'}-->selected="selected"<!--{/if}-->>Thailand</option>
											<option value="TN" <!--{if $smarty_data['Data'][$key]['country'] == 'TN'}-->selected="selected"<!--{/if}-->>Tunisia</option>
											<option value="TR" <!--{if $smarty_data['Data'][$key]['country'] == 'TR'}-->selected="selected"<!--{/if}-->>Turkey</option>
											<option value="UG" <!--{if $smarty_data['Data'][$key]['country'] == 'UG'}-->selected="selected"<!--{/if}-->>Uganda</option>
											<option value="AE" <!--{if $smarty_data['Data'][$key]['country'] == 'AE'}-->selected="selected"<!--{/if}-->>United Arab Emirates</option>
											<option value="UK" <!--{if $smarty_data['Data'][$key]['country'] == 'UK'}-->selected="selected"<!--{/if}-->>United Kingdom</option>
											<option value="US" <!--{if $smarty_data['Data'][$key]['country'] == 'US' || $smarty_data['Data'][$key]['country'] == ''}-->selected="selected"<!--{/if}-->>USA</option>
											<option value="VU" <!--{if $smarty_data['Data'][$key]['country'] == 'VU'}-->selected="selected"<!--{/if}-->>Vanuatu</option>
											<option value="VE" <!--{if $smarty_data['Data'][$key]['country'] == 'VE'}-->selected="selected"<!--{/if}-->>Venezuela</option>
										</select>
										<!--{if isset($smarty_data['Errors'][$key]['country']['status']) || (!isset($smarty_data['Errors'][$key]['country']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors'][$key]['country'])}-->
											<!--{$smarty_data['Errors'][$key]['country']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>					
									<div>
										<label for="address_<!--{$smarty.section.address.index}-->">Address</label>
										<input type="text" name="address_<!--{$smarty.section.address.index}-->" id="address_<!--{$smarty.section.address.index}-->" class="input--address" data-validation="required" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your street address" data-validation-length="max55" <!--{if isset($smarty_data['Data'][$key]['address'])}-->value="<!--{$smarty_data['Data'][$key]['address']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors'][$key]['address']) || (!isset($smarty_data['Errors'][$key]['address']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors'][$key]['address'])}-->
											<!--{$smarty_data['Errors'][$key]['address']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>									
									<div>
										<label for="address2_<!--{$smarty.section.address.index}-->">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_<!--{$smarty.section.address.index}-->" id="address2_<!--{$smarty.section.address.index}-->" class="input--address2" data-validation-length="max55" <!--{if isset($smarty_data['Data'][$key]['address2'])}-->value="<!--{$smarty_data['Data'][$key]['address2']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors'][$key]['address2']) || (!isset($smarty_data['Errors'][$key]['address2']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors'][$key]['address2'])}-->
											<!--{$smarty_data['Errors'][$key]['address2']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_<!--{$smarty.section.address.index}-->">City</label>
											<input type="text" name="city_<!--{$smarty.section.address.index}-->" id="city_<!--{$smarty.section.address.index}-->" class="input--city" data-validation="required" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your city" data-validation-length="max30" <!--{if isset($smarty_data['Data'][$key]['city'])}-->value="<!--{$smarty_data['Data'][$key]['city']}-->"<!--{/if}-->>
											<!--{if isset($smarty_data['Errors'][$key]['city']) || (!isset($smarty_data['Errors'][$key]['city']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors'][$key]['city'])}-->
												<!--{$smarty_data['Errors'][$key]['city']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>	
										<div class="c__item third">
											<label for="state_<!--{$smarty.section.address.index}-->">State</label>
											<input type="text" name="state_<!--{$smarty.section.address.index}-->" id="state_<!--{$smarty.section.address.index}-->" class="input--state" data-validation="required customstate" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY" <!--{if isset($smarty_data['Data'][$key]['state'])}-->value="<!--{$smarty_data['Data'][$key]['state']}-->"<!--{/if}-->>
											<!--{if isset($smarty_data['Errors'][$key]['state']['status']) || (!isset($smarty_data['Errors'][$key]['state']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors'][$key]['state'])}-->
												<!--{$smarty_data['Errors'][$key]['state']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>										
										<div class="c__item third">
											<label for="zip_<!--{$smarty.section.address.index}-->">ZIP</label>
											<input type="text" name="zip_<!--{$smarty.section.address.index}-->" id="zip_<!--{$smarty.section.address.index}-->" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20" <!--{if isset($smarty_data['Data'][$key]['zip'])}-->value="<!--{$smarty_data['Data'][$key]['zip']}-->"<!--{/if}-->>
											<!--{if isset($smarty_data['Errors'][$key]['zip']['status']) || (!isset($smarty_data['Errors'][$key]['zip']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
											<span class="help-block form-error">
											<!--{if isset($smarty_data['Errors'][$key]['zip'])}-->
												<!--{$smarty_data['Errors'][$key]['zip']['message']}-->
											<!--{/if}-->
											</span>
											<!--{/if}-->
										</div>
									</div>	
									<div>
										<label for="phone_<!--{$smarty.section.address.index}-->">Phone</label>
										<input type="text" name="phone_<!--{$smarty.section.address.index}-->" id="phone_<!--{$smarty.section.address.index}-->" class="input--phone" data-validation="required phone" data-validation-if-checked="address-<!--{$smarty.section.address.index}-->" data-validation-error-msg="Please enter your phone number" data-validation-length="max30" <!--{if isset($smarty_data['Data'][$key]['phone'])}-->value="<!--{$smarty_data['Data'][$key]['phone']}-->"<!--{/if}-->>
										<!--{if isset($smarty_data['Errors'][$key]['phone']['status']) || (!isset($smarty_data['Errors'][$key]['phone']['status']) && isset($smarty_data['Errors']['noaddress']))}-->
										<span class="help-block form-error">
										<!--{if isset($smarty_data['Errors'][$key]['phone'])}-->
											<!--{$smarty_data['Errors'][$key]['phone']['message']}-->
										<!--{/if}-->
										</span>
										<!--{/if}-->
									</div>		
								</div>
							</fieldset>
							<!-- end address-<!--{$smarty.section.address.index}-->-->
							<!--{/section}-->
							
							<fieldset>	
								<div class="field">
								<small>
									<a href="#" class="button" id="add-address"><i class="icon-plus"></i> Add another address</a></label>									
									<a href="#" class="button is-hidden" id="remove-address"><i class="icon-minus"></i> Remove last address</a></label>
								</small>
								</div>
							</fieldset>		
								
							<fieldset>	
								<div class="field">
									<input type="submit" class="submit" value="I'm Done! Submit Addresses" style="width: 100%">
								</div>
							</fieldset>		

						</form>							
					</div>
				</div>
			</div>
		</div>
	</section>

<!--{/block}-->