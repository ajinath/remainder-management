//= require jquery
//= require jquery_ujs
//= require moment
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require jquery_nested_form
//= require_tree .
  $(document).ready(function(){
   	$('.datepicker').datepicker({
      format: 'dd-mm-yyyy'
   	});
    $('.datetimepicker').datetimepicker({
        format: 'LT'
       });
  });
