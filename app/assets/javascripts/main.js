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
// var $text = $('#story_content');
//
// var clearContent = function(){
//   $text.innerHTML = "";
// }
//
// clearContent()
