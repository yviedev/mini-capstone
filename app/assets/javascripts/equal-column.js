function bootstrap_equalizer() {
  $(".equalizer").each(function() {
    var heights = $(this).find(".my-col").map(function() {
      return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);

    $(".watch").height(maxHeight);
  });
}