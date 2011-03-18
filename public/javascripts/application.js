var Aumodoro = {

  
};



$(document).ready(function(){
  // Notifications
  $('.notice, .alert').hide().fadeIn(3000);
  
  // Datepicker
  if ($('.datepicker').length > 0) {
    $('.datepicker').timepicker();
  }
  
  // Color picker
  $('.color_picker').simpleColor({
		cellWidth: 9,
		cellHeight: 9,
		border: '1px solid #333333',
		buttonClass: 'button'
  });
  
});
