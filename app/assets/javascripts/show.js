$(function(){
  $('.mini_image').hover(function(){
   var $thisImg = $(this).attr('src');
   $('.big_image').attr({src:$thisImg});
  });
 });