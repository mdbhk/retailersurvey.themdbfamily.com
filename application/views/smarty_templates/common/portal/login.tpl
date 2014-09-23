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
	</section>

	<section id="login-form">
		<div class="g__wrap">
			<div class="g__wrap-2">
				<div class="g cf g__collapse-custom">
					<div class="g__item g__three-col"></div>
					<div class="g__item g__six-col">
						<form action="/portal/login/post" method="post">	
						
							<!--{if isset($smarty_data['error']) && $smarty_data['error'] === true}-->
							<div class="message error"><b>Error:</b> Username or password is incorrect. Please correct and try again.</div>
							<!--{/if}-->
						
							<fieldset>							
								<div class="legend">
									<h4>Login</h4>
								</div>													
								<div class="field">
									<div>
										<label for="username">Username</label>
										<input type="text" name="username" id="username" data-validation="required" data-validation-error-msg="Please enter your username">
									</div>
									<div>
										<label for="password">Password</label>
										<input type="password" name="password" id="password" data-validation="required" data-validation-error-msg="Please enter your password">	
									</div>										
								</div>
								<div class="field">
									<input type="submit" class="submit" value="Login" style="width: 100%">
								</div>
							</fieldset>		

						</form>							
					</div>
				</div>
			</div>
		</div>
	</section>

<!--{/block}-->