// Custom JavaScript by Garrett Estrin | GarrettEstrin.com

$name = "Garrett"

$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});

$('textarea').keypress(function(event) {
   if (event.which == 13) {
      event.preventDefault();
      // var s = $(this).val();
      $(this).val("\n");
   }
});​

$('#login').on('click', function(){
$('.login').toggleClass('login');
})
