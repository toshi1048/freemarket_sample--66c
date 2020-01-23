$(function(){
  $('.mini_image img').click(function(){
   var $thisImg = $(this).attr('src');
   alert()
   $('.big_image img').attr({src:$thisImg});
  });
 });