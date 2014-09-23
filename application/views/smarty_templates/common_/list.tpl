<!--{extends file='admin/layout_new.tpl'}-->

<!--{block name="title"}--><!--{/block}-->

<!--{block name="header"}--><!--{/block}-->

<!--{block name="body"}--> class="tm tl ceo"<!--{/block}-->

<!--{block name="contentwrapper"}-->
		<div class="cf">
			<section>
				<div id="controls">
					<label for="filter">Filter: </label><input id="filter" type="text" name="filter" placeholder="Product Name/ Model" />
				</div>
				<form id="stockForm" action="/<!--{$smarty_data['webid']}-->/products/post" method="POST">
				<table id="stocks">
					<!--{foreach from=$smarty_data['stocks']['header'] item=header }-->
					<col width="<!--{$header.DisplaySize}-->" />
					<!--{/foreach}-->
					<thead>
						<tr>
							<!--{foreach from=$smarty_data['stocks']['header'] item=header }-->
							<th width="<!--{$header.DisplaySize}-->"><!--{$header.DisplayName}--></th>
							<!--{/foreach}-->
						</tr>
					</thead>
					<tbody>
						<!--{foreach from=$smarty_data['stocks']['downloadslist'] item=list}-->
						<tr data-id="<!--{$list.ID}-->">
							<td><!--{$list.ProductName}--></td>
							<td><!--{$list.ProductModel}--></td>
							<td>$ <input class="price required digits" type="text" name="price-<!--{$list.ID}-->" value="<!--{$list.ProductPrice}-->" /></td>
							<td>
								<input class="products" type="text" name="products[]" value="<!--{$list.ID}-->" />
								<input type="hidden" name="productName-<!--{$list.ID}-->" value="<!--{$list.ProductName}-->" />
								<button type="button" class="master instock<!--{if $list.Instock == 1 && $list.PreOrder != 1 && $list.Optional != 1}--> active<!--{/if}-->">In Stock</button>
								<button type="button" class="master outofstock<!--{if $list.Instock == 0 && $list.Optional != 1}--> active<!--{/if}-->">Out of Stock</button>
								<button type="button" class="master preorder<!--{if $list.PreOrder == 1}--> active<!--{/if}-->">Pre-order</button>
								<button type="button" class="master option<!--{if $list.Optional == 1}--> active<!--{/if}-->">Optional</button>
								<input type="radio" name="status-<!--{$list.ID}-->" value="0" />
								<input type="radio" name="status-<!--{$list.ID}-->" value="1" />
								<input type="radio" name="master-<!--{$list.ID}-->" value="instock" <!--{if $list.Instock == 1 && $list.PreOrder != 1 && $list.Optional != 1}-->checked<!--{/if}--> />
								<input type="radio" name="master-<!--{$list.ID}-->" value="outofstock" <!--{if $list.Instock == 0 && $list.Optional != 1}-->checked<!--{/if}--> />
								<input type="radio" name="master-<!--{$list.ID}-->" value="preorder" <!--{if $list.PreOrder == 1 && $list.Instock == 1}-->checked<!--{/if}--> />
								<input type="radio" name="master-<!--{$list.ID}-->" value="option" <!--{if $list.Optional == 1}-->checked<!--{/if}--> />
								<p class="master preorderlist" <!--{if $list.PreOrder ==1}-->style="display: block;"<!--{/if}-->><span>ETA</span><input type="text" name="master-eta-<!--{$list.ID}-->" placeholder="Expected Arrival Time" value="<!--{if $list.PreOrder ==1}--><!--{$list.PreOrderText}--><!--{/if}-->" class="required" /></p>
								<ul class="optionlist" <!--{if $list.Optional == 1}-->style="display: block;"<!--{/if}-->>
									<!--{foreach from=$list.Options item=option}-->
									<li data-id="<!--{$option.ColorID}-->">
										<span><!--{$option.ColorSlug}--></span>
										<button type="button" class="instock<!--{if $option.InStock == 1 && $option.PreOrder != 1}--> active<!--{/if}-->">In Stock</button>
										<button type="button" class="outofstock<!--{if $option.InStock == 0 && $option.PreOrder == 0}--> active<!--{/if}-->">Out of Stock</button>
										<button type="button" class="preorder<!--{if $option.InStock == 1 && $option.PreOrder == 1}--> active<!--{/if}-->">Pre-order</button>
										<input type="radio" name="option-<!--{$list.ID}-->[<!--{$option.ID}-->]" value="instock" <!--{if $option.InStock == 1}-->checked<!--{/if}--> />
										<input type="radio" name="option-<!--{$list.ID}-->[<!--{$option.ID}-->]" value="outofstock" <!--{if $option.InStock == 0 && $option.PreOrder != 1}-->checked<!--{/if}--> />
										<input type="radio" name="option-<!--{$list.ID}-->[<!--{$option.ID}-->]" value="preorder" <!--{if $option.PreOrder == 1}-->checked<!--{/if}--> />
										<p class="preorderlist" <!--{if $option.PreOrder == 1}-->style="display: block;"<!--{/if}-->><span>ETA</span><input type="text" name="eta-<!--{$option.ID}-->" placeholder="Expected Arrival Time" value="<!--{if $option.PreOrder == 1}--><!--{$option.PreOrderText}--><!--{/if}-->" class="required" /></p>
									</li>
									<!--{/foreach}-->
								</ul>
							</td>
						</tr>
						<!--{/foreach}-->
						<tr class="control">
							<td></td>
							<td></td>
							<td></td>
							<td><input type="submit" value="Submit" /></td>
						</tr>
					</tbody>
				</table>
				
				<div id="floatcontrol">
					<div><input type="submit" value="Submit" /></div>
				</div>
				</form>
			</section>	
		</div>
<!--{/block}-->

<!--{block name="custom_js"}-->
<script>

	$( document ).ready( function() {
	
		$( '#stockForm' ).validate();
	
		$( '.instock, .outofstock, .preorder, .option' ).on( 'click', function() {
			
			if ( $( this ).is( '.master' ) )
			{
				/*
				if ( $( this ).is( '.option' ) )
				{
					$( this ).toggleClass( 'active');
				}
				else
				{
					$( this ).parent().find( 'button.master' ).removeClass( 'active' );
					$( this ).addClass( 'active');
					
					$( this ).parent().find( '.optionlist li' ).each( function() {
						$( this ).find( 'button' ).removeClass( 'active' );
					});
				}
				*/
				
				$( this ).parent().find( 'input[name=status-' + $( this ).parent().find( '.products' ).val() + '][value=1]' ).prop( 'checked', true );
				
				$( this ).parent().find( 'button.master' ).removeClass( 'active' );
				$( this ).addClass( 'active');
				
				$( this ).parent().find( '.optionlist li' ).each( function() {
					$( this ).find( 'button' ).removeClass( 'active' );
				});
				
				if ( $( this ).is( '.instock' ) )
				{
					$( this ).parent().find( '.preorderlist' ).hide( '1000' ).removeClass( 'active' ).find( 'input' ).val('');
					
					$( this ).parent().find( 'input[value=instock]' ).prop( 'checked', true );
					
					$( this ).parent().find( '.optionlist li' ).each( function() {
						$( this ).find( '.instock' ).addClass( 'active' );
					});
					
					$( this ).parent().find( '.optionlist' ).hide( '1000' );
				}
				else if ( $( this ).is( '.outofstock' ) )
				{
					$( this ).parent().find( '.preorderlist' ).hide( '1000' ).removeClass( 'active' ).find( 'input' ).val('');
				
					$( this ).parent().find( 'input[value=outofstock]' ).prop( 'checked', true );
				
					$( this ).parent().find( '.optionlist li' ).each( function() {
						$( this ).find( '.outofstock' ).addClass( 'active' );
					});
					
					$( this ).parent().find( '.optionlist' ).hide( '1000' );
				}
				else if ( $( this ).is( '.preorder' ) )
				{
					$( this ).parent().find( '.preorderlist' ).not( '.active' ).toggle( '1000' ).toggleClass( 'active' );
				
					$( this ).parent().find( 'input[value=preorder]' ).prop( 'checked', true );
				
					$( this ).parent().find( '.optionlist li' ).each( function() {
						$( this ).find( '.preorder' ).addClass( 'active' );
					});
					
					$( this ).parent().find( '.optionlist' ).hide( '1000' );
				}
				else if ( $( this ).is( '.option' ) )
				{
					$( this ).parent().find( '.optionlist li' ).each( function() {
						$( this ).find( '.preorderlist' ).hide().removeClass( 'active' );
						$( this ).find( 'input[type=radio]' ).prop( 'checked', false );
					});
					$( this ).parent().find( '.optionlist' ).show( '1000' );
					$( '.master.preorderlist.active').hide( '1000' ).removeClass( 'active' );
				}
			}
			else
			{
				$( this ).parent().parent().parent().find( 'input[name=status-' + $( this ).parent().parent().parent().find( '.products' ).val() + '][value=1]' ).prop( 'checked', true );
			
				$( this ).parent().find( 'button' ).removeClass( 'active' );
				
				$( this ).parent().find( 'input[type=radio][value=' + $( this ).attr( 'class' ) + ']' ).prop( 'checked', true );
			
				checkOptions( $( this ).parent().parent(), $( this ).attr( 'class' ) );
			
				$( this ).toggleClass( 'active' );
			
				if ( $( this ).is( '.preorder' ) )
				{
					$( this ).parent().find( '.preorderlist' ).show( '1000' ).addClass( 'active' );
				}
				else
				{
					$( this ).parent().find( '.preorderlist' ).hide( '1000' ).removeClass( 'active' ).find( 'input' ).val('');
				}
			}
			
		});
		
		$( '.master.preorderlist input' ).on( 'change', function() {
		
			eta = $( this ).val();
		
			$( this ).parent().parent().find( '.preorderlist' ).not( '.master' ).each( function() {
				$( this ).find( 'input' ).val( eta );
			});
		});
		
		$( '#filter' ).on( 'change', function() {
		
			filter = $( this ).val().toLowerCase();
			
			if ( filter != '' )
			{
				$( '#stocks tbody tr:not(.control)' ).each( function() {
					$( this ).hide( '500' );
				});
			}
			else
			{
				$( '#stocks tbody tr:not(.control)' ).each( function() {
					$( this ).show( '500' );
				});
			}
			
			$( '#stocks tbody tr:not(.control)' ).each( function() {
				
				productName = $( this ).find( 'td' ).eq(0).text().toLowerCase();
				productModel = $( this ).find( 'td' ).eq(1).text().toLowerCase();
				
				if ( productName.indexOf( filter ) != -1 || productModel.indexOf( filter ) != -1 )
				{
					$( this ).show( '500' );
				}
				
			});
		});
		
	})
	
	function checkOptions( element, value )
	{
		var consistent = true;
		
		element.find( 'li' ).each( function()
		{
			if ( $( this ).find( 'input[type=radio]:checked' ).val() != value )
			{
				consistent = false;
				return;
			}
		});
		
		if ( consistent )
		{
			if ( element.find( 'li' ).size() == 1 ){
				element.parent().find( 'button.master:not(.option)' ).removeClass( 'active' );
			
				if ( value != 'preorder' )
				{
					element.parent().find( '.master.preorderlist.active' ).toggle( '1000' ).toggleClass( 'active' );
				}
			}
			
			element.parent().find( 'input[type=radio][value=' + value + ']' ).prop( 'checked', true );
			element.parent().find( 'button.master.' + value ).addClass( 'active' );
			
			if ( value == 'preorder' )
			{
				element.parent().find( '.master.preorderlist' ).toggle( '1000' ).toggleClass( 'active' );
			}
			
			element.parent().find( 'button.option.active' ).removeClass( 'active' );
			element.hide( '1000' );
		}
		else
		{
			element.parent().find( 'input[type=radio][value=option]' ).prop( 'checked', true );
			element.parent().find( 'button.master:not(.option)' ).removeClass( 'active' );
			
			element.parent().find( '.master.preorderlist.active' ).toggle( '1000' ).toggleClass( 'active' );
		}
	}

</script>
<!--{/block}-->