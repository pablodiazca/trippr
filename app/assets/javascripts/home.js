# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


//$(function() {
//  $('a[href*=#]:not([href=#])').click(function() {
//    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
//      var target = $(this.hash);
//      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
//      if (target.length) {
//        $('html,body').animate({
//          scrollTop: target.offset().top
//        }, 1000);
//        return false;
//      }
//    }
//  });
//});

$('.posts').waypoint(function() {
  $('.profile-logo').toggleClass('.appear')
}, { offset: 300 });