$(document).ready(function(){
	$(".add_product").click(function(){
		$("select").removeAttr("id"); //

		$form = $(this).parents(".add_product_form").clone(true);
		$form.removeClass("first");
		
		$(".products").append($form);

		$("select").selectpicker('refresh');
	});

	$(".remove_product").click(function(){
		$(this).parents(".add_product_form").remove();
	});
});