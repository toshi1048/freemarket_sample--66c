$(document).on("ready",function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                     <label class="js-file" for="submit-box">
                    <input type="file" 
                    name="item[images_attributes][${num}][image]"
                    id="submit-box">
                  </label></div>`;
    return html;
  }
  
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="120px" height="100px">
    <div class="js-remove">削除</div>`;
    return html;
  }

  const buildNewField = function(){
    const html = `<div id="image-box2">
                   <div id="previews2"></div>
                   <div data-index="5" class="js-file_group2">
                   <label class="js-file2" for="submit-box2">
                    <input type="file" 
                    name="item[images_attributes][5][image]"
                    id="submit-box2"></input>
                  </label></div></div>`
    return html;
  };
  const buildFileField2 = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group2">
                     <label class="js-file2" for="submit-box2">
                    <input type="file" 
                    name="item[images_attributes][${num}][image]"
                    id="submit-box2">
                  </label></div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index'); //.js-fileがthis。そのparentのdata-indexの値をとる。
    console.log(fileIndex);
    console.log(targetIndex);
    console.log(lastIndex)
    const file = e.target.files[0]; //eventのchangeされた要素のファイル
    const blobUrl = window.URL.createObjectURL(file);//ひとつ上で保存したファイルのblobURL

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl); //peview内に表示されている画像のsrcの値を新しく投稿したfileのblobUrlで上書き
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift(); //fileIndexの配列の最初の要素をとる
      $(this).parent().remove();
      var ImgLength = $('#previews').children().length;
      $('#previews').css('width',`calc(120px * ${ImgLength})`);
      $('.js-file_group').css('width',`calc(620px - (120px * ${ImgLength}))`);
      
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      if (ImgLength >= 5){
        $('.js-file_group').hide();
        $('.sell__form--img').append(buildNewField);
      }
    }
  });
  $(document).on('change', '.js-file2', function(e) {
    const targetIndex = $(this).parent().data('index'); //.js-fileがthis。そのparentのdata-indexの値をとる。
    console.log($(this).parent())
    console.log(fileIndex)
    console.log(targetIndex)
    console.log(lastIndex)
    const file = e.target.files[0]; //eventのchangeされた要素のファイル
    const blobUrl = window.URL.createObjectURL(file);//ひとつ上で保存したファイルのblobURL
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl); //peview内に表示されている画像のsrcの値を新しく投稿したfileのblobUrlで上書き
    } else {  // 新規画像追加の処理
      $('#previews2').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box2').append(buildFileField2(fileIndex[0]));
      fileIndex.shift(); //fileIndexの配列の最初の要素をとる
      $(this).parent().remove();
      var ImgLength2 = $('#previews2').children().length;
      $('#previews2').css('width',`calc(120px * ${ImgLength2})`);
      $('.js-file_group2').css('width',`calc(620px - (120px * ${ImgLength2}))`);
      if (ImgLength2 >= 5){
        $('.js-file_group2').hide();
      }
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $(document).on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    var ImgLength = $('#previews').children().length;
    if (ImgLength = 4){
      $('.js-file_group').show();
    }
  });
});

