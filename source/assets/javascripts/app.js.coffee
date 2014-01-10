//= require jquery/jquery.min.js

scrollControll = ->
  headerHeight = 106
  phone = (navigator.userAgent.match(/iPhone/i)) or (navigator.userAgent.match(/iPod/i)) or (navigator.userAgent.match(/Android/i)) or (navigator.userAgent.match(/Windows Phone OS/i))
  ipad = (navigator.userAgent.match(/iPad/i))

  unless phone
    header = "big"
    headerTop = $("header h1").position().top
    $(window).scroll ->
      scrolled = $(this).scrollTop()
      if scrolled > headerHeight and header is "big"
        header = "small"
        $("#menu h1").animate({ opacity: 1 })
      else if scrolled < headerHeight and header == "small"
        header = "big"
        $("#menu h1").animate({ opacity: 0 })


dist = $("#hero").css("max-width")

bindHero = ->
  $("#hero").bind "mouseover", moveRight

moveRight = ->
  head = $(this).children(".head")
  body = $(this).children(".body")
  head.animate { left: "+=" + dist }, 200, ->
    head.hide()
    body.show().animate({ opacity: 1 }, 200).bind("mouseout", moveLeft)
  $(this).unbind("mouseover")

moveLeft = ->
  body = $(this)
  head = body.prev()
  head.show().animate({ left: "-=" + dist }, 500, bindHero)
  body.animate({ opacity: 0 }, 500).hide()
  $(this).unbind "mouseout"

$ ->
  bindHero()
  scrollControll()
