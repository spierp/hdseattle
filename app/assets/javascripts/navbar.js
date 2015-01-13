$(window).scroll(function() {
  if ($(".navbar").offset().top > 50) {
    $(".navbar-fixed-top").addClass("top-nav-collapse");
    $(".dropdown-menu").removeClass("dropdown-menu-nav-open");
  } else {
    $(".navbar-fixed-top").removeClass("top-nav-collapse");
    $(".dropdown-menu").addClass("dropdown-menu-nav-open");
  }
});
