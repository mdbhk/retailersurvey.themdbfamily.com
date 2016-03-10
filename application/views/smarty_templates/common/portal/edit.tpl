<!--{extends file='layout_admin.tpl'}-->

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
						<a href="/portal"><p class="align-center"><img src="/images/rs/logo.png" alt="MDB"></p></a>					
					</div>
				</div>
			</div>
		</div>
		<div id="logout"><a href="/portal/logout">Logout</a></div>
	</section>
						
	<section id="survey-form">
		
		<div class="g__wrap">
			<div class="g__wrap-2">
				<div class="g cf g__collapse-custom">				
					<div class="g__item g__one-col"></div>
					<div class="g__item g__ten-col">
						<h3>Edit ID : <!--{$smarty_data['surveys'].ID}--></h3>
						<form action="/portal/save" method="post">	
						<input type="hidden" name="surveyID" id="surveyID" value="<!--{$smarty_data['surveys'].ID}-->">
						<input type="hidden" name="Addresscount" id="Addresscount" value="<!--{$smarty_data['surveys'].Addresscount}-->">						
							<fieldset>						
								<div class="legend">
									<h4>General Information</h4>
								</div>													
								<div class="field">			
									<div>
										<label for="custno">MDB customer number</label>
										<input type="text" name="custno" id="custno" data-validation="required" data-validation-error-msg="Please enter your customer number" data-validation-length="max20" value="<!--{$smarty_data['surveys'].CustNo}-->">
									</div>
									<div id="custno-result"></div>			
									<div>
										<label for="website">Website address <em>(optional)</em></label>
										<input type="text" name="website" id="website" data-validation-optional="true" data-validation="url" data-validation-error-msg="Please enter a valid URL in the format http://www.domain.com" value="<!--{$smarty_data['surveys'].Website}-->">	
									</div>	
									<div>
										<label for="email">Your email address</label>
										<input type="text" name="email" id="email" data-validation="required" data-validation="email" data-validation-error-msg="Please enter a valid email address" value="<!--{$smarty_data['surveys'].Email}-->">	
									</div>										
								</div>
							</fieldset>							
							
							<!--{assign var="counter" value=0}-->
							<!--{foreach from=$smarty_data['surveys'].Addresses item=address}-->
								<!--{assign var="counter" value=$counter+1}-->									
									<fieldset class="address address--<!--{$counter}-->" style="display: block;">		
										<div class="legend">
											<input type="hidden" name="addressID_<!--{$counter}-->" value="<!--{$address.ID}-->">
											<h4>Address #<!--{$counter}--><span></span></h4>											
											<span class="slide"><i class="icon-arrow-down"></i></span>
										</div>	
													
													
													
										<div class="field">		
											<label></label>
											<div class="c cf delete-field">								
												<div class="c__item">											
													<div class="checkbox-wrap2">
														<label for="is-delete_<!--{$counter}-->">
														<div class="checkbox-wrap__input"><input name="is-delete_<!--{$counter}-->" type="checkbox" class="input--is-delete"  value="is-delete" ></div>
														<div class="checkbox-wrap__label">
															<b>Delete Address</b>
														</div>
														</label>
													</div>										
												</div>													
											</div>														
										</div>	
													
										<div class="field">		
											<label>Address type - <b>Select one or both</b></label>
											<div class="c cf store-field">								
												<div class="c__item half">											
													<div class="checkbox-wrap <!--{if $address.isShipTo}-->selected<!--{/if}-->">
														<label for="is-ship-to_<!--{$counter}-->">
														<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_<!--{$counter}-->" name="is-ship-to_<!--{$counter}-->" class="input--is-ship-to" value="is-ship-to" data-validation="has-store-type" data-validation-error-msg="Please select at least one" <!--{if $address.isShipTo}-->checked<!--{/if}-->></div>
														<div class="checkbox-wrap__label">
															Ship-to address
														</div>
														</label>
													</div>										
												</div>	
												<div class="c__item half">											
													<div class="checkbox-wrap <!--{if $address.isStore}-->selected<!--{/if}-->">
														<label for="is-store_<!--{$counter}-->">
														<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_<!--{$counter}-->" name="is-store_<!--{$counter}-->" class="input--is-store" value="is-store" data-validation="has-store-type" data-validation-error-msg="Please select at least one" <!--{if $address.isStore}-->checked<!--{/if}-->></div>
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
												<label for="name_<!--{$counter}-->"><!--{if $address.isShipTo && $address.isStore}-->Ship-to/store name<!--{else if $address.isShipTo}-->Ship-to name<!--{else if $address.isStore}-->Store name<!--{else}-->Ship-to/store name <em>(please select above)</em><!--{/if}--></label>
												<input type="text" name="name_<!--{$counter}-->" id="name_<!--{$counter}-->" class="input--name" data-validation="required" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50" value="<!--{$address.Name}-->">
											</div>	
											<div>
												<label for="country_<!--{$counter}-->">Country</label>
												<select name="country_<!--{$counter}-->" id="country_<!--{$counter}-->" class="input--country" data-validation="required" data-validation-error-msg="Please enter your country">		
													<option value="DZ" <!--{if $address.Country=='DZ'}-->SELECTED<!--{/if}-->>Algeria</option>
											<option value="AR" <!--{if $address.Country=='AR'}-->SELECTED<!--{/if}-->>Argentina</option>
											<option value="AW" <!--{if $address.Country=='AW'}-->SELECTED<!--{/if}-->>Aruba</option>
											<option value="AU" <!--{if $address.Country=='AU'}-->SELECTED<!--{/if}-->>Australia</option>
											<option value="AT" <!--{if $address.Country=='AT'}-->SELECTED<!--{/if}-->>Austria</option>
											<option value="BS" <!--{if $address.Country=='BS'}-->SELECTED<!--{/if}-->>Bahamas</option>
											<option value="BH" <!--{if $address.Country=='BH'}-->SELECTED<!--{/if}-->>Bahrain</option>
											<option value="BB" <!--{if $address.Country=='BB'}-->SELECTED<!--{/if}-->>Barbados</option>
											<option value="BE" <!--{if $address.Country=='BE'}-->SELECTED<!--{/if}-->>Belgium</option>
											<option value="BM" <!--{if $address.Country=='BM'}-->SELECTED<!--{/if}-->>Bermuda</option>
											<option value="BR" <!--{if $address.Country=='BR'}-->SELECTED<!--{/if}-->>Brazil</option>
											<option value="BN" <!--{if $address.Country=='BN'}-->SELECTED<!--{/if}-->>Brunei Darussalam</option>
											<option value="BG" <!--{if $address.Country=='BG'}-->SELECTED<!--{/if}-->>Bulgaria</option>
											<option value="CA" <!--{if $address.Country=='CA'}-->SELECTED<!--{/if}-->>Canada</option>
											<option value="CN" <!--{if $address.Country=='CN'}-->SELECTED<!--{/if}-->>China</option>
											<option value="HR" <!--{if $address.Country=='HR'}-->SELECTED<!--{/if}-->>Croatia</option>
											<option value="CY" <!--{if $address.Country=='CY'}-->SELECTED<!--{/if}-->>Cyprus</option>
											<option value="CZ" <!--{if $address.Country=='CZ'}-->SELECTED<!--{/if}-->>Czech Republic</option>
											<option value="DK" <!--{if $address.Country=='DK'}-->SELECTED<!--{/if}-->>Denmark</option>
											<option value="DR" <!--{if $address.Country=='DR'}-->SELECTED<!--{/if}-->>DOMINICAN REPUBLIC</option>
											<option value="EC" <!--{if $address.Country=='EC'}-->SELECTED<!--{/if}-->>Ecuador</option>
											<option value="EE" <!--{if $address.Country=='EE'}-->SELECTED<!--{/if}-->>Estonia</option>
											<option value="FJ" <!--{if $address.Country=='FJ'}-->SELECTED<!--{/if}-->>Fiji Islands</option>
											<option value="FI" <!--{if $address.Country=='FI'}-->SELECTED<!--{/if}-->>Finland</option>
											<option value="FR" <!--{if $address.Country=='FR'}-->SELECTED<!--{/if}-->>France</option>
											<option value="DE" <!--{if $address.Country=='DE'}-->SELECTED<!--{/if}-->>Germany</option>
											<option value="GB" <!--{if $address.Country=='GB'}-->SELECTED<!--{/if}-->>Great Britain</option>
											<option value="EL" <!--{if $address.Country=='EL'}-->SELECTED<!--{/if}-->>Greece</option>
											<option value="HK" <!--{if $address.Country=='HK'}-->SELECTED<!--{/if}-->>Hong Kong</option>
											<option value="HU" <!--{if $address.Country=='HU'}-->SELECTED<!--{/if}-->>Hungary</option>
											<option value="IS" <!--{if $address.Country=='IS'}-->SELECTED<!--{/if}-->>Iceland</option>
											<option value="IN" <!--{if $address.Country=='IN'}-->SELECTED<!--{/if}-->>India</option>
											<option value="ID" <!--{if $address.Country=='ID'}-->SELECTED<!--{/if}-->>Indonesia</option>
											<option value="IE" <!--{if $address.Country=='IE'}-->SELECTED<!--{/if}-->>Ireland</option>
											<option value="IT" <!--{if $address.Country=='IT'}-->SELECTED<!--{/if}-->>Italy</option>
											<option value="JP" <!--{if $address.Country=='JP'}-->SELECTED<!--{/if}-->>Japan</option>
											<option value="KE" <!--{if $address.Country=='KE'}-->SELECTED<!--{/if}-->>Kenya</option>
											<option value="LV" <!--{if $address.Country=='LV'}-->SELECTED<!--{/if}-->>Latvia</option>
											<option value="LT" <!--{if $address.Country=='LT'}-->SELECTED<!--{/if}-->>Lithuania</option>
											<option value="LU" <!--{if $address.Country=='LU'}-->SELECTED<!--{/if}-->>Luxembourg</option>
											<option value="MY" <!--{if $address.Country=='MY'}-->SELECTED<!--{/if}-->>Malaysia</option>
											<option value="MT" <!--{if $address.Country=='MT'}-->SELECTED<!--{/if}-->>Malta</option>
											<option value="MX" <!--{if $address.Country=='MX'}-->SELECTED<!--{/if}-->>Mexico</option>
											<option value="ME" <!--{if $address.Country=='ME'}-->SELECTED<!--{/if}-->>Montenegro</option>
											<option value="MO" <!--{if $address.Country=='MO'}-->SELECTED<!--{/if}-->>Morocco</option>
											<option value="MZ" <!--{if $address.Country=='MZ'}-->SELECTED<!--{/if}-->>Mozambique</option>
											<option value="NL" <!--{if $address.Country=='NL'}-->SELECTED<!--{/if}-->>Netherlands</option>
											<option value="AN" <!--{if $address.Country=='AN'}-->SELECTED<!--{/if}-->>Netherlands Antilles</option>
											<option value="NZ" <!--{if $address.Country=='NZ'}-->SELECTED<!--{/if}-->>New Zealand</option>
											<option value="NG" <!--{if $address.Country=='NG'}-->SELECTED<!--{/if}-->>Nigeria</option>
											<option value="NO" <!--{if $address.Country=='NO'}-->SELECTED<!--{/if}-->>Norway</option>
											<option value="PA" <!--{if $address.Country=='PA'}-->SELECTED<!--{/if}-->>Panama</option>
											<option value="PH" <!--{if $address.Country=='PH'}-->SELECTED<!--{/if}-->>Philippines</option>
											<option value="PL" <!--{if $address.Country=='PL'}-->SELECTED<!--{/if}-->>Poland</option>
											<option value="PT" <!--{if $address.Country=='PT'}-->SELECTED<!--{/if}-->>Portugal</option>
											<option value="PR" <!--{if $address.Country=='PR'}-->SELECTED<!--{/if}-->>Puerto Rico</option>
											<option value="RO" <!--{if $address.Country=='RO'}-->SELECTED<!--{/if}-->>Romania</option>
											<option value="RU" <!--{if $address.Country=='RU'}-->SELECTED<!--{/if}-->>Russia</option>
											<option value="WS" <!--{if $address.Country=='WS'}-->SELECTED<!--{/if}-->>Samoa</option>
											<option value="SA" <!--{if $address.Country=='SA'}-->SELECTED<!--{/if}-->>Saudi Arabia</option>
											<option value="RS" <!--{if $address.Country=='RS'}-->SELECTED<!--{/if}-->>Serbia</option>
											<option value="SG" <!--{if $address.Country=='SG'}-->SELECTED<!--{/if}-->>Singapore</option>
											<option value="SK" <!--{if $address.Country=='SK'}-->SELECTED<!--{/if}-->>Slovakia</option>
											<option value="SI" <!--{if $address.Country=='SI'}-->SELECTED<!--{/if}-->>Slovenia</option>
											<option value="SB" <!--{if $address.Country=='SB'}-->SELECTED<!--{/if}-->>Solomon Islands</option>
											<option value="ZA" <!--{if $address.Country=='ZA'}-->SELECTED<!--{/if}-->>South Africa</option>
											<option value="ES" <!--{if $address.Country=='ES'}-->SELECTED<!--{/if}-->>Spain</option>
											<option value="SZ" <!--{if $address.Country=='SZ'}-->SELECTED<!--{/if}-->>Swaziland</option>
											<option value="SE" <!--{if $address.Country=='SE'}-->SELECTED<!--{/if}-->>Sweden</option>
											<option value="CH" <!--{if $address.Country=='CH'}-->SELECTED<!--{/if}-->>Switzerland</option>
											<option value="TW" <!--{if $address.Country=='TW'}-->SELECTED<!--{/if}-->>Taiwan</option>
											<option value="TZ" <!--{if $address.Country=='TZ'}-->SELECTED<!--{/if}-->>Tanzania</option>
											<option value="TH" <!--{if $address.Country=='TH'}-->SELECTED<!--{/if}-->>Thailand</option>
											<option value="TN" <!--{if $address.Country=='TN'}-->SELECTED<!--{/if}-->>Tunisia</option>
											<option value="TR" <!--{if $address.Country=='TR'}-->SELECTED<!--{/if}-->>Turkey</option>
											<option value="UG" <!--{if $address.Country=='UG'}-->SELECTED<!--{/if}-->>Uganda</option>
											<option value="AE" <!--{if $address.Country=='AE'}-->SELECTED<!--{/if}-->>United Arab Emirates</option>
											<option value="UK" <!--{if $address.Country=='UK'}-->SELECTED<!--{/if}-->>United Kingdom</option>
											<option value="US" <!--{if $address.Country=='US'}-->SELECTED<!--{/if}-->>USA</option>
											<option value="VU" <!--{if $address.Country=='VU'}-->SELECTED<!--{/if}-->>Vanuatu</option>
											<option value="VE"<!--{if $address.Country=='VE'}-->SELECTED<!--{/if}--> >Venezuela</option>
												</select>
											</div>					
											<div>
												<label for="address_<!--{$counter}-->">Address</label>
												<input type="text" name="address_<!--{$counter}-->" id="address_<!--{$counter}-->" class="input--address" data-validation="required" data-validation-error-msg="Please enter your street address" data-validation-length="max55" value="<!--{$address.Address}-->">	
											</div>									
											<div>
												<label for="address2_<!--{$counter}-->">Address 2 <em>(optional)</em></label>
												<input type="text" name="address2_<!--{$counter}-->" id="address2_<!--{$counter}-->" class="input--address2" data-validation-length="max55" value="<!--{$address.Address2}-->">	
											</div>									
											<div class="c cf">								
												<div class="c__item third">
													<label for="city_<!--{$counter}-->">City</label>
													<input type="text" name="city_<!--{$counter}-->" id="city_<!--{$counter}-->" class="input--city" data-validation="required" data-validation-error-msg="Please enter your city" data-validation-length="max30"  value="<!--{$address.City}-->">
												</div>	
												<div class="c__item third">
													<label for="state_<!--{$counter}-->">State</label>
													<input type="text" name="state_<!--{$counter}-->" id="state_<!--{$counter}-->" class="input--state" data-validation="required customstate" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY"  value="<!--{$address.State}-->">			
												</div>										
												<div class="c__item third">
													<label for="zip_<!--{$counter}-->">ZIP</label>
													<input type="text" name="zip_<!--{$counter}-->" id="zip_<!--{$counter}-->" class="input--zip" data-validation="required customzip" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20"  value="<!--{$address.Zip}-->">	
												</div>
											</div>	
											<div>
												<label for="phone_<!--{$counter}-->">Phone</label>
												<input type="text" name="phone_<!--{$counter}-->" id="phone_<!--{$counter}-->" class="input--phone" data-validation="required phone" data-validation-error-msg="Please enter your phone number" data-validation-length="max30"  value="<!--{$address.Phone}-->">
											</div>		
										</div>										
									</fieldset><!-- end address-->		
								
								<!--{/foreach}-->
																
								<!--{for $counter=($smarty_data['surveys'].Addresscount+1) to 10}-->								
									<fieldset class="address address--<!--{$counter}-->">		
								<div class="legend">
									<input type="hidden" name="addressID_<!--{$counter}-->" value="">
									<h9>Address #<!--{$counter}--><span></span></h9>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-<!--{$counter}-->" name="address-<!--{$counter}-->">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_<!--{$counter}-->">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_<!--{$counter}-->" name="is-ship-to_<!--{$counter}-->" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_<!--{$counter}-->">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_<!--{$counter}-->" name="is-store_<!--{$counter}-->" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_<!--{$counter}-->">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_<!--{$counter}-->" id="name_<!--{$counter}-->" class="input--name" data-validation="required" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>					
									<div>
										<label for="country_<!--{$counter}-->">Country</label>
										<select name="country_<!--{$counter}-->" id="country_<!--{$counter}-->" class="input--country" data-validation="required" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your country
											<option value="DZ" >Algeria</option>
											<option value="AR" >Argentina</option>
											<option value="AW" >Aruba</option>
											<option value="AU" >Australia</option>
											<option value="AT" >Austria</option>
											<option value="BS" >Bahamas</option>
											<option value="BH" >Bahrain</option>
											<option value="BB" >Barbados</option>
											<option value="BE" >Belgium</option>
											<option value="BM" >Bermuda</option>
											<option value="BR" >Brazil</option>
											<option value="BN" >Brunei Darussalam</option>
											<option value="BG" >Bulgaria</option>
											<option value="CA" >Canada</option>
											<option value="CN" >China</option>
											<option value="HR" >Croatia</option>
											<option value="CY" >Cyprus</option>
											<option value="CZ" >Czech Republic</option>
											<option value="DK" >Denmark</option>
											<option value="DR" >DOMINICAN REPUBLIC</option>
											<option value="EC" >Ecuador</option>
											<option value="EE" >Estonia</option>
											<option value="FJ" >Fiji Islands</option>
											<option value="FI" >Finland</option>
											<option value="FR" >France</option>
											<option value="DE" >Germany</option>
											<option value="GB" >Great Britain</option>
											<option value="EL" >Greece</option>
											<option value="HK" >Hong Kong</option>
											<option value="HU" >Hungary</option>
											<option value="IS" >Iceland</option>
											<option value="IN" >India</option>
											<option value="ID" >Indonesia</option>
											<option value="IE" >Ireland</option>
											<option value="IT" >Italy</option>
											<option value="JP" >Japan</option>
											<option value="KE" >Kenya</option>
											<option value="LV" >Latvia</option>
											<option value="LT" >Lithuania</option>
											<option value="LU" >Luxembourg</option>
											<option value="MY" >Malaysia</option>
											<option value="MT" >Malta</option>
											<option value="MX" >Mexico</option>
											<option value="ME" >Montenegro</option>
											<option value="MO" >Morocco</option>
											<option value="MZ" >Mozambique</option>
											<option value="NL" >Netherlands</option>
											<option value="AN" >Netherlands Antilles</option>
											<option value="NZ" >New Zealand</option>
											<option value="NG" >Nigeria</option>
											<option value="NO" >Norway</option>
											<option value="PA" >Panama</option>
											<option value="PH" >Philippines</option>
											<option value="PL" >Poland</option>
											<option value="PT" >Portugal</option>
											<option value="PR" >Puerto Rico</option>
											<option value="RO" >Romania</option>
											<option value="RU" >Russia</option>
											<option value="WS" >Samoa</option>
											<option value="SA" >Saudi Arabia</option>
											<option value="RS" >Serbia</option>
											<option value="SG" >Singapore</option>
											<option value="SK" >Slovakia</option>
											<option value="SI" >Slovenia</option>
											<option value="SB" >Solomon Islands</option>
											<option value="ZA" >South Africa</option>
											<option value="ES" >Spain</option>
											<option value="SZ" >Swaziland</option>
											<option value="SE" >Sweden</option>
											<option value="CH" >Switzerland</option>
											<option value="TW" >Taiwan</option>
											<option value="TZ" >Tanzania</option>
											<option value="TH" >Thailand</option>
											<option value="TN" >Tunisia</option>
											<option value="TR" >Turkey</option>
											<option value="UG" >Uganda</option>
											<option value="AE" >United Arab Emirates</option>
											<option value="UK" >United Kingdom</option>
											<option value="US" selected>USA</option>
											<option value="VU" >Vanuatu</option>
											<option value="VE" >Venezuela</option>
										</select>
									</div>					
									<div>
										<label for="address_<!--{$counter}-->">Address</label>
										<input type="text" name="address_<!--{$counter}-->" id="address_<!--{$counter}-->" class="input--address" data-validation="required" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_<!--{$counter}-->">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_<!--{$counter}-->" id="address2_<!--{$counter}-->" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_<!--{$counter}-->">City</label>
											<input type="text" name="city_<!--{$counter}-->" id="city_<!--{$counter}-->" class="input--city" data-validation="required" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_<!--{$counter}-->">State</label>
											<input type="text" name="state_<!--{$counter}-->" id="state_<!--{$counter}-->" class="input--state" data-validation="required customstate" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_<!--{$counter}-->">ZIP</label>
											<input type="text" name="zip_<!--{$counter}-->" id="zip_<!--{$counter}-->" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_<!--{$counter}-->">Phone</label>
										<input type="text" name="phone_<!--{$counter}-->" id="phone_<!--{$counter}-->" class="input--phone" data-validation="required phone" data-validation-if-checked="address-<!--{$counter}-->" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-->								
							<!--{/for}-->
							
							
							
							
							<fieldset>	
								<div class="field">
								<small>
									<a href="#" class="button" id="add-address"><i class="icon-plus"></i> Add another address</a>
									<a href="#" class="button is-hidden" id="remove-address"><i class="icon-minus"></i> Remove last address</a>
								</small>
								</div>
							</fieldset>		
								
							<fieldset>	
								<div class="field">
									<input type="submit" class="submit" value="Save" > <a href="/portal" class="button" id="cancel" style="line-height:normal;">Cancel</a>
								</div>
							</fieldset>		

						</form>							
					</div>
				</div>
			</div>
		</div>
	</section>	
<!--{/block}-->