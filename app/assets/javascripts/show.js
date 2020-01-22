
$(function(){
  $('.mini_image').hover(function(){
      //オーバーしたliのインデックスを取得
      var index = $('.mini_image').index(this);
      //オーバーした画像URLを取得
      var imageurl = $('.mini_image').eq(index).find('img').attr('src');
      //ulのクラス名を取得（空白で分割）
      className = $(this).parent().attr('class').split(" ");
      //元のメイン画像を保存しておく
      defaultImage = $('.big_image.'+className[1]).attr('src');
      $('.big_image.'+className[1]).attr('src',imageurl);
  },function(){
      $('.big_image.'+className[1]).attr('src',defaultImage);
  })
}); 