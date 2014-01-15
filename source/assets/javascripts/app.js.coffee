//= require jquery/jquery.min.js

dist = 0

scrollControll = ->
  headerHeight = 95
  phone = (navigator.userAgent.match(/iPhone/i)) or (navigator.userAgent.match(/iPod/i)) or (navigator.userAgent.match(/Android/i)) or (navigator.userAgent.match(/Windows Phone OS/i))
  ipad = (navigator.userAgent.match(/iPad/i))

  unless phone
    header = "big"
    headerTop = $("header h1").position().top
    $(window).scroll ->
      scrolled = $(this).scrollTop()
      if scrolled > headerHeight and header is "big"
        header = "small"
      else if scrolled < headerHeight and header == "small"
        header = "big"
      else if scrolled < headerHeight and header == "big"
        percentage = (scrolled / headerHeight)
        $("header").css("opacity", 1 - percentage)
        $("#menu h1").css("opacity", 0 + percentage)


bindHero = ->
  $("#hero").bind "mouseover", moveRight

moveRight = ->
  head = $(this).children(".head")
  body = $(this).children(".body")
  head.animate { left: "+=" + dist }, 200, ->
    head.hide()
    body.show().animate({ opacity: 1 }, 200)
  body.bind("mouseout", moveLeft)
  $(this).unbind("mouseover")

moveLeft = ->
  body = $(this)
  head = body.prev()
  head.show().animate({ left: "-=" + dist }, 500, bindHero)
  body.animate({ opacity: 0 }, 500).hide()
  $(this).unbind "mouseout"

$ ->
  if $("#hero").attr("data-movable")
    dist = $("#hero").css("max-width")
    bindHero()
  if $("#header-row").size() > 0
    scrollControll()
