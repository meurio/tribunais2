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

  if($(".form_wraper").size()){
    $(window).scroll(function(){
      // fixed form
      if(typeof scrollable_form_y === "undefined")
        scrollable_form_y = $(".military_justice_downsides").position().top;

      if(window.scrollY >= scrollable_form_y && $(document).width() > 735){
        $(".form_wraper").addClass("fixed");
        $(".military_justice_downsides").css("margin-top", "87px");
      } else{
        $(".form_wraper").removeClass("fixed");
        $(".military_justice_downsides").css("margin-top", "0");
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
});
