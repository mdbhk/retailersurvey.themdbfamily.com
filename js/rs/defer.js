//@prepros-prepend min/jquery.dataTables.min.js
//@prepros-prepend min/jquery.lazyload.min.js
//@prepros-prepend min/jquery.form-validator.min.js
//@prepros-prepend min/jquery-ui.custom.min.js


/* General */ 

function isInArray(value, array) {
	return array.indexOf(value) > -1;
}

var stateArray = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'];
	
var caStateArray = ['AB', 'BC', 'MB', 'NB', 'NL', 'NS', 'NT', 'NU', 'ON', 'PE', 'QC', 'SK', 'YT'];
	
/* 
 * Forms
 */


$.formUtils.addValidator({
	name : 'phone',
	validatorFunction : function(value, $el, config, language, $form) {	
		if($el.closest('fieldset').find('.input--country').val() == 'US') {		
			$el.attr('data-validation-error-msg', 'Please enter your phone number in the format xxx-xxx-xxxx');
		
			value = value.trim();
			var regex = new RegExp(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/);
			
			if (regex.test(value)) {
				var formattedPhoneNumber = value.replace(regex, "$1-$2-$3");
				$el.val(formattedPhoneNumber);
				return true;
			} else {
				return false;
			}
		} else {
			$el.attr('data-validation-error-msg', 'Please enter your phone number');
			
			return true;
		}
	},
	errorMessageKey: 'badPhone'	
});

$.formUtils.addValidator({
	name : 'customzip',
	validatorFunction : function(value, $el, config, language, $form) {
		if($el.closest('fieldset').find('.input--country').val() == 'US') {		
			$el.attr('data-validation-error-msg', 'Please enter your 5 digit ZIP');
			
			if(/(^\d{5}$)/.test(value)) {
				return true;			
			} else {
				return false;			
			}
		} else {
			$el.attr('data-validation-error-msg', 'Please enter your ZIP');
			
			return true;
		}
	},
	errorMessageKey: 'customzip'
});

$.formUtils.addValidator({
	name : 'customstate',
	validatorFunction : function(value, $el, config, language, $form) {
		if($el.closest('fieldset').find('.input--country').val() == 'US') {
			$el.attr('data-validation-error-msg', 'Please enter your 2 letter state code');
			
			var capitalized = value.toUpperCase();
			$el.val( capitalized );
			
			if(isInArray(capitalized, stateArray)) {
				return true;			
			} else {
				return false;			
			}
		} else if($el.closest('fieldset').find('.input--country').val() == 'CA') {
			$el.attr('data-validation-error-msg', 'Please enter your 2 letter state code');
			
			var capitalized = value.toUpperCase();
			$el.val( capitalized );
			
			if(isInArray(capitalized, caStateArray)) {
				return true;			
			} else {
				return false;			
			}
		} else {
			$el.attr('data-validation-error-msg', 'Please enter your state');
			
			return true;
		}
	},
	errorMessageKey: 'customstate'
});

$.formUtils.addValidator({
	name : 'has-store-type',
	validatorFunction : function(value, $el, config, language, $form) {	
		var checks = $el.closest('.field').find('input:checked').length;		
			
		if(checks > 0) {
			return true;
		} else {
			return false;
		}
	},
	errorMessageKey: 'noStoreType'
});


$.validate({
	onError : function() {
		$('.address:visible').find('.field').each(function() {
			$(this).stop(true,true).slideDown(350, function() {
				$(this).closest('fieldset').find('.legend').removeClass('rolled');				
			});		
		});
    },
	onSuccess : function() {
		$('input').each(function() {
			$(this).val( $(this).val().replace(/\\/g, '') );
		});
	}
}); 
 

/*
 * Ajax
 */
 
$('#custno').on('keyup blur', function() {
	var data = new Object();
	data.custNo = $.trim($(this).val());
	var postData = 'parm=' + encodeURIComponent(escape(JSON.stringify(data)));
	
	$('#custno-result').html('Searching&hellip;').removeClass('form-error').removeClass('form-valid');
	
	// TEMPLATE NOTE: DO AJAX HERE
	if($.trim($(this).val()) != '') {
		$.ajax({
			url: '/ajax/survey/get_customer',
			async: true,
			type: "POST",
			cache: false,
			data: postData,
			success: function(data, textStatus, xhr) {
				var obj = JSON.parse(data);
				
				// Success message 
				if (obj.Result === true) {
					$('#custno').removeClass('error');
					
					// Success message layout
					$('#custno-result').html('"' + obj.Customer.Name+'" found - Please continue with form').addClass('form-valid').removeClass('form-error');
				}
				else { 
					$('#custno').addClass('error');
				
					var message = 'Customer could not be found';
					if ( obj.Message ) {
						message = obj.Message;
					}
					
					// Error message layout
					$('#custno-result').html(message).removeClass('form-valid').addClass('form-error');
				}
			},
			error: function(xhr, textStatus, errorThrown) {
				// Ajax error
				$('#custno-result').html('Server error, Please try again').removeClass('form-valid').addClass('form-error');
			}
		});
	} else {
		$('#custno-result').html('').removeClass('form-valid').addClass('form-error');
	}
});

$('#survey-form form').submit(function(e) {
	if(!$('#custno-result').hasClass('form-valid')) {
		$('#custno').trigger('focus');
		return false;
	} 
});
 
/*
 * Layout and effects 
 */

 /*
$('.checkbox-wrap__input input').change(function() {
	if($(this).is(":checked")) {
		$(this).parent().parent().parent().addClass('selected');
		
		if($(this).val() == 'is-ship-to') {
			$(this).closest('fieldset').find('.ship-to-name').stop(true,true).slideDown(350);
		}
		if($(this).val() == 'is-store') {
			$(this).closest('fieldset').find('.store-name').stop(true,true).slideDown(350);
		}		
	} else {
		$(this).parent().parent().parent().removeClass('selected');	
		
		if($(this).val() == 'is-ship-to') {
			$(this).closest('fieldset').find('.ship-to-name').stop(true,true).slideUp(350);
		}
		if($(this).val() == 'is-store') {
			$(this).closest('fieldset').find('.store-name').stop(true,true).slideUp(350);
		}
	}
});
*/

$('.checkbox-wrap__input input').change(function() {
	if($(this).is(":checked")) {
		$(this).parent().parent().parent().addClass('selected');
	} else {
		$(this).parent().parent().parent().removeClass('selected');	
	}
	
	var shipToChecked = $(this).closest('fieldset').find('.input--is-ship-to').prop('checked');
	var storeChecked = $(this).closest('fieldset').find('.input--is-store').prop('checked');
	
	if(shipToChecked == true && storeChecked == true) {
		$(this).closest('fieldset').find('.name label').html('Ship-to/store name');	
	} else if (shipToChecked == true) {
		$(this).closest('fieldset').find('.name label').html('Ship-to name');		
	} else if (storeChecked == true) {
		$(this).closest('fieldset').find('.name label').html('Store name');		
	} else {
		$(this).closest('fieldset').find('.name label').html('Ship-to/store name <em>(please select above)</em>');		
	}
});

$('.address .legend').click(function() {
	$(this).closest('fieldset').find('.field').each(function() {
		if($(this).is(':visible')) {
			$(this).stop(true,true).slideUp(350, function() {
				$(this).closest('fieldset').find('.legend').addClass('rolled');				
			});		
		} else {
			$(this).stop(true,true).slideDown(350);			
			$(this).closest('fieldset').find('.legend').removeClass('rolled');
		}
	});
});

$('#add-address').click(function(e) {
	$('.address:visible').last().find('.field').each(function() {
		$(this).stop(true,true).slideUp(350, function() {
			$(this).closest('fieldset').find('.legend').addClass('rolled');				
		});		
	});
	
	var next = $('.address:visible').last().next();
	next.slideDown(350);
	next.find('.enabled').prop('checked', true);
	next.find('.input--is-ship-to, .input--is-store').attr('data-validation', 'has-store-type');	
	next.find('.field').slideDown(350);
	next.find('.legend').removeClass('rolled');	
	
	if(next.hasClass('address--10')) {
		$('#add-address').addClass('is-hidden');
	}
		
	$('#remove-address').removeClass('is-hidden');
	
	e.preventDefault();
});

$('#remove-address').click(function(e) {
	var prev = $('.address:visible').last();	
	
	if(!prev.hasClass('address--1')) {	
		prev.find('input[type="checkbox"]').prop('checked', false).parent().parent().parent().removeClass('selected');
		prev.find('.ship-to-name, .store-name').hide();
		
		prev.find('.input--is-ship-to, .input--is-store').attr('data-validation', '');
		prev.slideUp(90);
		
		if(prev.hasClass('address--2')) {
			$('#remove-address').addClass('is-hidden');
		}
	}
	
	$('#add-address').removeClass('is-hidden');
	
	e.preventDefault();
});

$('.input--address').blur(function() {
	if($.trim($(this).val()) != '') {
		$(this).closest('.address').find('.legend h4 span').html(': ' + $(this).val());
	} else {
		$(this).closest('.address').find('.legend h4 span').html('');	
	}
});

$('.input--country').change(function() {
	var stateInput = $(this).closest('.address').find('.input--state').first();
	
	if($(this).val() == 'US') {
		$.formUtils.suggest(stateInput, stateArray);	 
	} else if($(this).val() == 'CA') {
		$.formUtils.suggest(stateInput, caStateArray);	 
	} else {
		$.formUtils.suggest(stateInput, '');
	}
});


/* data tables */
 
var table = $('#datatable').dataTable({
	"deferRender": false,
	"pageLength": 25
});

$('#datatable tbody').on( 'click', 'tr', function () {
	$(this).toggleClass('selected');
	
	if($('#datatable tr.selected').length) {
		$('#export-selected input[type="submit"], #hide-selected input[type="submit"]').prop('disabled', false);
	} else {
		$('#export-selected input[type="submit"], #hide-selected input[type="submit"]').prop('disabled', true);	
	}
});

$('#datatable_filter input').on('change', function() {
	if($.trim($(this).val())  != '') {
		$('#export-filtered input[type="submit"], #hide-filtered input[type="submit"]').prop('disabled', false);
	} else {
		$('#export-filtered input[type="submit"], #hide-filtered input[type="submit"]').prop('disabled', true);	
	}
});


$('a.popup').on('click', function(e) {
	$('#dialog').find('.popup-address').remove();
	$(this).next('.popup-address').clone().appendTo('#dialog').removeClass('is-hidden');
	
	$('#dialog').removeClass('is-hidden').dialog({
		minWidth: 500,
		maxHeight: 500,
		modal: true,
		draggable: false,
		closeText: "<i class='icon-cross'></i>",
		open: function() {
            $('.ui-widget-overlay').bind('click', function() {
                $('#dialog').dialog('close');
            })
        }, 		
		show: {
			effect: "fade",
			duration: 90
		},
		hide: {
			effect: "fade",
			duration: 90
		}
	});
	
	return false;
}); 


/* Export buttons */

$('#export-all').submit(function(e) {
});

$('#export-filtered').submit(function(e) {
	$('#export-filtered input[type="hidden"]').remove();

	var filteredRows = table._('tr', {"filter":"applied"});
	for(var i = 0; i < filteredRows.length; i++) {			
		$('#export-filtered').append('<input type="hidden" name="records[]" value="' + filteredRows[i][0] + '">');
	}	
});

$('#export-selected').submit(function(e) {
	$('#export-selected input[type="hidden"]').remove();
	
	var filteredRows = table._('tr.selected');
	for(var i = 0; i < filteredRows.length; i++) {			
		$('#export-selected').append('<input type="hidden" name="records[]" value="' + filteredRows[i][0] + '">');
	}	
});

$('#hide-all').submit(function(e) {
});

$('#hide-filtered').submit(function(e) {
	$('#hide-filtered input[type="hidden"]').remove();

	var filteredRows = table._('tr', {"filter":"applied"});
	for(var i = 0; i < filteredRows.length; i++) {			
		$('#hide-filtered').append('<input type="hidden" name="records[]" value="' + filteredRows[i][0] + '">');
	}	
});

$('#hide-selected').submit(function(e) {
	$('#hide-selected input[type="hidden"]').remove();
	
	var filteredRows = table._('tr.selected');
	for(var i = 0; i < filteredRows.length; i++) {			
		$('#hide-selected').append('<input type="hidden" name="records[]" value="' + filteredRows[i][0] + '">');
	}	
});