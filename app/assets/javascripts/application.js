// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require smooth-scroll.min
//= require_tree .

$(function(){
  $(document).foundation();
  smoothScroll.init();

  if($(".current-task-menu").size()){
    $(".current-task-menu").css("top", -$(".current-task-menu").height());
    $(".current-task-menu").show();
    $(window).scroll(function(){
      // fixed form
      if(typeof scrollable_form_y === "undefined")
        scrollable_form_y = $(".military_justice_downsides").position().top;

      if(window.scrollY >= scrollable_form_y){
        $(".current-task-menu").css("top", 0);
      } else{
        $(".current-task-menu").css("top", -$(".current-task-menu").height());
      }
    });
  }

  $('#share_on_facebook_button').click(function(){
    window.open(
      $(event.target).attr("data-href"),
      'facebox-share-dialog',
      'width=626,height=436'
    );
    return true;
  });

  $('#share_on_twitter_button').click(function(){
    window.open(
      $(event.target).attr("data-href"),
      'facebox-share-dialog',
      'width=626,height=436'
    );
    return true;
  });

  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
