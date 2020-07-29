// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require popper
//= require jquery3
//= require turbolinks
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree ../../assets/javascripts/.
//= require_tree .

// メインスライダー
$(function(){

  // $(document).on('turbolinks:load', function() {

    $("document").ready(function() {
      
      // オプションを指定してSkipprの実行
      $("#theTarget").skippr({
        // スライドショーの変化 ("fade" or "slide")
        transition : 'slide',
        // 変化に係る時間(ミリ秒)
        speed : 1000,
        // easingの種類
        easing : 'easeOutQuart',
        // ナビゲーションの形("block" or "bubble")
        navType : 'block',
        // 子要素の種類("div" or "img")
        childrenElementType : 'div',
        // ナビゲーション矢印の表示(trueで表示)
        arrows : true,
        // スライドショーの自動再生(falseで自動再生なし)
        autoPlay : true,
        // 自動再生時のスライド切替間隔(ミリ秒)
        autoPlayDuration : 3000,
        // キーボードの矢印キーによるスライド送りの設定(trueで有効)
        keyboardOnAlways : true,
        // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
        hidePrevious : false
      });
    });

  // });

});


// ページトップへ「戻るボタン」（上がボタン自体の表示と非表示・下がクリックした時の動作）
$(function() {
  var backBtn = $('#back a')
  backBtn.hide();
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      backBtn.fadeIn(300);
    } else {
      backBtn.fadeOut(300);
    }
  });
  backBtn.on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
  event.preventDefault();
  });
});

// 「hachijo-img」の「leftIn」モーション
$(function () {
  $('div.hachijo-img').each(function () {
    var $win = $(window),
        $winH = $win.height(),
        $connect = $(this),
        position = $connect.offset().top,
        current = 0,
        scroll;
    $win.on('load scroll', function () {
      scroll = $win.scrollTop();
      current = (scroll / $winH) * 2 * 10;
      if (current > 99.9) {
        current = 50;
      }
      if (scroll > position - $winH) {
        $connect.css({width: current + '%'});
      }
    });
  });
});

// lineを表示するやーつ
$(function () {
  $('div.line').each(function () {
    var $win = $(window),
        $winH = $win.height(),
        $connect = $(this),
        position = $connect.offset().top,
        current = 0,
        scroll;
    $win.on('load scroll', function () {
      scroll = $win.scrollTop();
      current = (1 - (position - scroll) / $winH) * 2 * 50;
      if (current > 99.9) {
        current = 100;
      }
      if (scroll > position - $winH) {
        $connect.css({width: current + '%'});
      }
    });
  });
});





// _flash-notice用
$(function(){
  setTimeout("$('.flash-notice, .flash-back').fadein('slow')", 500) 
  setTimeout("$('.flash-notice, .flash-back').fadeOut('slow')", 2000) 
})
// flash-alert用
$(function(){
  setTimeout("$('.flash-alert').fadein('slow')", 500) 
  setTimeout("$('.flash-alert').fadeOut('slow')", 3000) 
})