var Aumodoro = {

  
};



$(document).ready(function(){
  // Notifications
  $('.notice, .alert').hide().fadeIn(3000);
  
  // Datepicker
  if ($('.datepicker').length > 0) {
    $('.datepicker').timepicker();
  }
  
});
