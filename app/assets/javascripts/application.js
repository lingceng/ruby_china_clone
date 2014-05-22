//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require nprogress
//= require bootstrap
//= require_tree .
//

$(document).ready(function(){
  $(".dropdown-toggle").dropdown();
});

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });


