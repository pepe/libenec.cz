//= require jquery/jquery.min.js

dist = "56em"

bindHero = ->
  $("#hero .head").bind "mouseover", moveRight

moveRight = ->
  $(this).animate { left: "+=" + dist }, 200, ->
    $(this).hide()
    $(this).next().show().bind("mouseout", moveLeft)
  $(this).next().css("opacity", 1)
  $(this).unbind "mouseover"

moveLeft = ->
  $(this).prev().show().animate({ left: "-=" + dist }, 500, bindHero)
  $(this).animate({ opacity: 0 }, 500).hide()
  $(this).unbind "mouseout"

$ ->
  bindHero()
