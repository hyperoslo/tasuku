(function() {
  $(function() {
    $(window).on('resize', function() {
      return $('.banner').css({
        height: $(window).height()
      });
    });
    return $(window).trigger('resize');
  });

}).call(this);
