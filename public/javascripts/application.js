var Aumodoro = {

  timer: {
    seconds_elapsed: 0,
    count_up: false,
    pom_length_in_minutes: 25,
    display_element: '.timer',
    interval: undefined,
    to_string: "",
    minutes: 0,
    seconds: 0,
    
    
    start: function() {
      var self = this;
      clearInterval(this.interval);
      this.interval = setInterval(function(){
        self.seconds_elapsed = self.seconds_elapsed + 1;
        
        if (self.seconds_elapsed >= (60*self.pom_length_in_minutes)) {
          self.complete();
        } else {
          self.update_interface();
        }
      }, 1000);
      
      // ! auto update pom record start
    },
    
    complete: function() {
      clearInterval(this.interval);
      this.seconds_elapsed = 0;
      // ! auto update pom record end
    },
    
    update_interface: function(){
      if (this.count_up) {
        this.minutes = parseInt(this.seconds_elapsed / 60, 10);
        this.seconds = this.seconds_elapsed % 60.0;
      } else {
        this.minutes = (this.pom_length_in_minutes-1) - parseInt(this.seconds_elapsed / 60, 10);
        this.seconds = 60 - this.seconds_elapsed % 60.0;
      }
      if (this.minutes < 10) {
        this.minutes = "0"+this.minutes;
      }
      if (this.seconds < 10) {
        this.seconds = "0"+this.seconds;
      }
      this.to_string = this.minutes+":"+this.seconds;
      $(this.display_element).html(this.to_string);
      
      this.update_title();
    },
    
    update_title: function() {
      document.title = this.to_string;
    },
    
    init: function(options) {
      this.pom_length_in_minutes = options.pom_length_in_minutes || this.pom_length_in_minutes;
      this.count_up = options.count_up;
      this.seconds_elapsed = options.seconds_elapsed || this.seconds_elapsed;
      this.display_element = options.display_element || this.display_element;
    }
  },
  
  
  pomodoro: {
  
  },


  init: function() {
    
    $('.notes_label').toggle(function() {
      $('.notes').slideDown();
    }, function() {
      $('.notes').slideUp();
    });
  
  }
};



$(document).ready(function(){
  // Notifications
  $('.notice, .alert').hide().fadeIn(3000);
  
  // Datepicker 
  $('.datetimepicker').datetimepicker();
  
  // Color picker
  $('.color_picker').simpleColor({
		cellWidth: 9,
		cellHeight: 9,
		border: '1px solid #333333',
		buttonClass: 'button'
  });
  
  // Timer
  if($('.timer').length > 0) {
    Aumodoro.timer.start();
  }
  
  // Calendar		
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},

		allDaySlot: false,
		slotMinutes: 30, 
		defaultEventMinutes: 30,
		defaultView: 'agendaDay',
		editable: true,
		events: '/poms/calendar.json'
	});
	
 
  
  Aumodoro.init();
});
