// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
   $('#client_client_id').on('change',function() {
    console.log("works")
    console.log($(this).val());
   $.ajax({
       url: '/clients/' + $(this).val(),
       method: 'GET',
       data: {},
       dataType: 'json'
     }).done(function(responseData) {
       cars_array = []
      for (var i = 0; i < responseData.length; i++) {
        model = responseData[i].model
        cars_array.push(model)
      }
       console.log(responseData);
       console.log(cars_array);

       for (var i = 0; i < responseData.length; i++) {
         var CarItem =  $('<option class="car"></option>');
         CarItem.attr('value', responseData[i].id);
         CarItem.html(responseData[i].model)
         $('#job_car_id').append(CarItem)
       }

     });
   });
});
