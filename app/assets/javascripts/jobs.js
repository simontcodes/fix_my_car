// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
   $('#client_client_id').on('change',function() {
    console.log($(this).val());
   $.ajax({
       url: '/clients/' + $(this).val(),
       method: 'GET',
       data: {},
       dataType: 'json'
     }).done(function(responseData) {
       $('#job_car_id').html("")
       for (var i = 0; i < responseData.length; i++) {
         var CarItem =  $('<option class="car"></option>');
         CarItem.attr('value', responseData[i].id);
         CarItem.html(responseData[i].model)
         $('#job_car_id').append(CarItem)
       }
     });
   });
});
