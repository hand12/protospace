$(window).on("load", function() {
    $('.plus').on('click', function() {
      $('.appear').show();
      $(this).hide();
    });

    $('.preview').each(function() {
      // previewクラスを配列でたくさん取ってくる
      // それぞれにfunction()を行う
      var self = $(this)
      // 変数selfにjqueryオブジェクトとしてpreviewで突ってこれるオブジェクトを代入する
      var input = self.find('input[type=file]')
      // 変数selfの中で、inputタグを探し、変数inputに代入する

      input.change(function() {
      // 変数inputの中身が変わったら、function()を実行する
        var file = $(this).prop('files')[0]
        // 変数fileに変数inputのfiles[0]を代入する
        var fileReader = new FileReader()
        // FileAPIのインスタンスを一個生成する
        // この時点ではfileReaderは空っぽ

        fileReader.onload = function() {
        // fileReaderが読み込まれたら、function()を実行する
          // このselfは上の方で定義した$(this)。
          // rubyと違って、関数の中に関数を定義しているからスコープがややこしい
          self.css({
          // fileReaderのcss を書き換える
            'background-image': 'url(' + fileReader.result + ')',
            // background-imageプロパティをfileReaderのresultに書き換える
            'background-size': 'contain'
          })
        }
        fileReader.readAsDataURL(file)
      })
    })

})
