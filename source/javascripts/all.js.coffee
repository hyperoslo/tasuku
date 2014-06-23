#= require_tree .

$ ->

  $(window).on 'resize', ->
    $('.banner').css height: $(window).height()

  $(window).trigger 'resize'

  new WOW().init()
