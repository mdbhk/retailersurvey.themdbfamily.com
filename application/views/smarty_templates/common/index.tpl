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
							<fieldset>						
								<div class="legend">
									<h4>General Information</h4>
								</div>													
								<div class="field">			
									<div>
										<label for="custno">Your MDB customer number -
										<b>Required. Find on your invoices, or by contacting your account specialist </b></label>
										<input type="text" name="custno" id="custno" data-validation="required" data-validation-error-msg="Please enter your customer number" data-validation-length="max20">
									</div>
									<div id="custno-result"></div>			
									<div>
										<label for="website">Your website address <em>(optional)</em></label>
										<input type="text" name="website" id="website" data-validation-optional="true" data-validation="url" data-validation-error-msg="Please enter a valid URL in the format http://www.domain.com">	
									</div>	
									<div>
										<label for="email">Your email address</label>
										<input type="text" name="email" id="email" data-validation="required" data-validation="email" data-validation-error-msg="Please enter a valid email address">	
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
									<label>Address type - <b>Select one or both</b></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_1">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_1" name="is-ship-to_1" class="input--is-ship-to" value="is-ship-to" data-validation="has-store-type" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_1">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_1" name="is-store_1" class="input--is-store" value="is-store" data-validation="has-store-type" data-validation-error-msg="Please select at least one"></div>
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
										<input type="text" name="name_1" id="name_1" class="input--name" data-validation="required" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">
									</div>	
									<div>
										<label for="country_1">Country</label>
										<select name="country_1" id="country_1" class="input--country" data-validation="required" data-validation-error-msg="Please enter your country">		
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
										<label for="address_1">Address</label>
										<input type="text" name="address_1" id="address_1" class="input--address" data-validation="required" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_1">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_1" id="address2_1" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_1">City</label>
											<input type="text" name="city_1" id="city_1" class="input--city" data-validation="required" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_1">State</label>
											<input type="text" name="state_1" id="state_1" class="input--state" data-validation="required customstate" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_1">ZIP</label>
											<input type="text" name="zip_1" id="zip_1" class="input--zip" data-validation="required customzip" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_1">Phone</label>
										<input type="text" name="phone_1" id="phone_1" class="input--phone" data-validation="required phone" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-1-->
							
							<fieldset class="address address--2">		
								<div class="legend">
									<h4>Address #2<span></span></h4>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-2" name="address-2">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_2">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_2" name="is-ship-to_2" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_2">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_2" name="is-store_2" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_2">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_2" id="name_2" class="input--name" data-validation="required" data-validation-if-checked="address-2" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>			
									<div>
										<label for="country_2">Country</label>
										<select name="country_2" id="country_2" class="input--country" data-validation="required" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your country
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
										<label for="address_2">Address</label>
										<input type="text" name="address_2" id="address_2" class="input--address" data-validation="required" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_2">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_2" id="address2_2" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_2">City</label>
											<input type="text" name="city_2" id="city_2" class="input--city" data-validation="required" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_2">State</label>
											<input type="text" name="state_2" id="state_2" class="input--state" data-validation="required customstate" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_2">ZIP</label>
											<input type="text" name="zip_2" id="zip_2" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_2">Phone</label>
										<input type="text" name="phone_2" id="phone_2" class="input--phone" data-validation="required phone" data-validation-if-checked="address-2" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-2-->
							
							<fieldset class="address address--3">		
								<div class="legend">
									<h4>Address #3<span></span></h4>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-3" name="address-3">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_3">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_3" name="is-ship-to_3" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_3">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_3" name="is-store_3" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_3">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_3" id="name_3" class="input--name" data-validation="required" data-validation-if-checked="address-3" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>			
									<div>
										<label for="country_3">Country</label>
										<select name="country_3" id="country_3" class="input--country" data-validation="required" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your country
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
										<label for="address_3">Address</label>
										<input type="text" name="address_3" id="address_3" class="input--address" data-validation="required" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_3">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_3" id="address2_3" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_3">City</label>
											<input type="text" name="city_3" id="city_3" class="input--city" data-validation="required" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_3">State</label>
											<input type="text" name="state_3" id="state_3" class="input--state" data-validation="required customstate" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_3">ZIP</label>
											<input type="text" name="zip_3" id="zip_3" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_3">Phone</label>
										<input type="text" name="phone_3" id="phone_3" class="input--phone" data-validation="required phone" data-validation-if-checked="address-3" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-3-->
							
							<fieldset class="address address--4">		
								<div class="legend">
									<h4>Address #4<span></span></h4>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-4" name="address-4">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_4">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_4" name="is-ship-to_4" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_4">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_4" name="is-store_4" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_4">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_4" id="name_4" class="input--name" data-validation="required" data-validation-if-checked="address-4" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>			
									<div>
										<label for="country_4">Country</label>
										<select name="country_4" id="country_4" class="input--country" data-validation="required" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your country
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
										<label for="address_4">Address</label>
										<input type="text" name="address_4" id="address_4" class="input--address" data-validation="required" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_4">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_4" id="address2_4" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_4">City</label>
											<input type="text" name="city_4" id="city_4" class="input--city" data-validation="required" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_4">State</label>
											<input type="text" name="state_4" id="state_4" class="input--state" data-validation="required customstate" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_4">ZIP</label>
											<input type="text" name="zip_4" id="zip_4" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_4">Phone</label>
										<input type="text" name="phone_4" id="phone_4" class="input--phone" data-validation="required phone" data-validation-if-checked="address-4" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-4-->
							
							<fieldset class="address address--5">		
								<div class="legend">
									<h5>Address #5<span></span></h5>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-5" name="address-5">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_5">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_5" name="is-ship-to_5" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_5">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_5" name="is-store_5" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_5">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_5" id="name_5" class="input--name" data-validation="required" data-validation-if-checked="address-5" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>			
									<div>
										<label for="country_5">Country</label>
										<select name="country_5" id="country_5" class="input--country" data-validation="required" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your country
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
										<label for="address_5">Address</label>
										<input type="text" name="address_5" id="address_5" class="input--address" data-validation="required" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_5">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_5" id="address2_5" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_5">City</label>
											<input type="text" name="city_5" id="city_5" class="input--city" data-validation="required" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_5">State</label>
											<input type="text" name="state_5" id="state_5" class="input--state" data-validation="required customstate" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_5">ZIP</label>
											<input type="text" name="zip_5" id="zip_5" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_5">Phone</label>
										<input type="text" name="phone_5" id="phone_5" class="input--phone" data-validation="required phone" data-validation-if-checked="address-5" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-5-->
							
							<fieldset class="address address--6">		
								<div class="legend">
									<h6>Address #6<span></span></h6>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-6" name="address-6">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_6">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_6" name="is-ship-to_6" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_6">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_6" name="is-store_6" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_6">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_6" id="name_6" class="input--name" data-validation="required" data-validation-if-checked="address-6" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>					
									<div>
										<label for="country_6">Country</label>
										<select name="country_6" id="country_6" class="input--country" data-validation="required" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your country
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
										<label for="address_6">Address</label>
										<input type="text" name="address_6" id="address_6" class="input--address" data-validation="required" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_6">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_6" id="address2_6" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_6">City</label>
											<input type="text" name="city_6" id="city_6" class="input--city" data-validation="required" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_6">State</label>
											<input type="text" name="state_6" id="state_6" class="input--state" data-validation="required customstate" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_6">ZIP</label>
											<input type="text" name="zip_6" id="zip_6" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_6">Phone</label>
										<input type="text" name="phone_6" id="phone_6" class="input--phone" data-validation="required phone" data-validation-if-checked="address-6" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-6-->
							
							<fieldset class="address address--7">		
								<div class="legend">
									<h7>Address #7<span></span></h7>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-7" name="address-7">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_7">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_7" name="is-ship-to_7" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_7">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_7" name="is-store_7" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_7">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_7" id="name_7" class="input--name" data-validation="required" data-validation-if-checked="address-7" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>				
									<div>
										<label for="country_7">Country</label>
										<select name="country_7" id="country_7" class="input--country" data-validation="required" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your country
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
										<label for="address_7">Address</label>
										<input type="text" name="address_7" id="address_7" class="input--address" data-validation="required" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_7">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_7" id="address2_7" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_7">City</label>
											<input type="text" name="city_7" id="city_7" class="input--city" data-validation="required" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_7">State</label>
											<input type="text" name="state_7" id="state_7" class="input--state" data-validation="required customstate" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_7">ZIP</label>
											<input type="text" name="zip_7" id="zip_7" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_7">Phone</label>
										<input type="text" name="phone_7" id="phone_7" class="input--phone" data-validation="required phone" data-validation-if-checked="address-7" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-7-->
							
							<fieldset class="address address--8">		
								<div class="legend">
									<h8>Address #8<span></span></h8>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-8" name="address-8">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_8">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_8" name="is-ship-to_8" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_8">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_8" name="is-store_8" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_8">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_8" id="name_8" class="input--name" data-validation="required" data-validation-if-checked="address-8" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>			
									<div>
										<label for="country_8">Country</label>
										<select name="country_8" id="country_8" class="input--country" data-validation="required" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your country
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
										<label for="address_8">Address</label>
										<input type="text" name="address_8" id="address_8" class="input--address" data-validation="required" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_8">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_8" id="address2_8" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_8">City</label>
											<input type="text" name="city_8" id="city_8" class="input--city" data-validation="required" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_8">State</label>
											<input type="text" name="state_8" id="state_8" class="input--state" data-validation="required customstate" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_8">ZIP</label>
											<input type="text" name="zip_8" id="zip_8" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_8">Phone</label>
										<input type="text" name="phone_8" id="phone_8" class="input--phone" data-validation="required phone" data-validation-if-checked="address-8" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-8-->
							
							<fieldset class="address address--9">		
								<div class="legend">
									<h9>Address #9<span></span></h9>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-9" name="address-9">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_9">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_9" name="is-ship-to_9" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_9">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_9" name="is-store_9" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_9">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_9" id="name_9" class="input--name" data-validation="required" data-validation-if-checked="address-9" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>					
									<div>
										<label for="country_9">Country</label>
										<select name="country_9" id="country_9" class="input--country" data-validation="required" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your country
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
										<label for="address_9">Address</label>
										<input type="text" name="address_9" id="address_9" class="input--address" data-validation="required" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_9">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_9" id="address2_9" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_9">City</label>
											<input type="text" name="city_9" id="city_9" class="input--city" data-validation="required" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_9">State</label>
											<input type="text" name="state_9" id="state_9" class="input--state" data-validation="required customstate" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_9">ZIP</label>
											<input type="text" name="zip_9" id="zip_9" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_9">Phone</label>
										<input type="text" name="phone_9" id="phone_9" class="input--phone" data-validation="required phone" data-validation-if-checked="address-9" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-9-->
							
							<fieldset class="address address--10">		
								<div class="legend">
									<h10>Address #10<span></span></h10>
									<span class="slide"><i class="icon-arrow-down"></i></span>
								</div>	
								
								<input type="checkbox" class="enabled is-hidden" id="address-10" name="address-10">
								
								<div class="field">		
									<label>This is a&hellip; <em>(select one or both)</em></label>
									<div class="c cf store-field">								
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-ship-to_10">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-ship-to_10" name="is-ship-to_10" class="input--is-ship-to" value="is-ship-to" data-validation-error-msg="Please select at least one"></div>
												<div class="checkbox-wrap__label">
													Ship-to address
												</div>
												</label>
											</div>										
										</div>	
										<div class="c__item half">											
											<div class="checkbox-wrap">
												<label for="is-store_10">
												<div class="checkbox-wrap__input"><input type="checkbox" id="is-store_10" name="is-store_10" class="input--is-store" value="is-store" data-validation-error-msg="Please select at least one"></div>
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
										<label for="name_10">Ship-to/store name <em>(please select above)</em></label>
										<input type="text" name="name_10" id="name_10" class="input--name" data-validation="required" data-validation-if-checked="address-10" data-validation-error-msg="Please enter a name for the address" data-validation-length="max50">		
									</div>				
									<div>
										<label for="country_10">Country</label>
										<select name="country_10" id="country_10" class="input--country" data-validation="required" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your country
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
										<label for="address_10">Address</label>
										<input type="text" name="address_10" id="address_10" class="input--address" data-validation="required" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your street address" data-validation-length="max55">	
									</div>									
									<div>
										<label for="address2_10">Address 2 <em>(optional)</em></label>
										<input type="text" name="address2_10" id="address2_10" class="input--address2" data-validation-length="max55">	
									</div>									
									<div class="c cf">								
										<div class="c__item third">
											<label for="city_10">City</label>
											<input type="text" name="city_10" id="city_10" class="input--city" data-validation="required" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your city" data-validation-length="max30">
										</div>	
										<div class="c__item third">
											<label for="state_10">State</label>
											<input type="text" name="state_10" id="state_10" class="input--state" data-validation="required customstate" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your state"  data-validation-length="max30" data-suggestions="AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY">			
										</div>										
										<div class="c__item third">
											<label for="zip_10">ZIP</label>
											<input type="text" name="zip_10" id="zip_10" class="input--zip" data-validation="required customzip" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your ZIP" data-validation-length="max20">	
										</div>
									</div>	
									<div>
										<label for="phone_10">Phone</label>
										<input type="text" name="phone_10" id="phone_10" class="input--phone" data-validation="required phone" data-validation-if-checked="address-10" data-validation-error-msg="Please enter your phone number" data-validation-length="max30">
									</div>		
								</div>
							</fieldset><!-- end address-10-->
							
							
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