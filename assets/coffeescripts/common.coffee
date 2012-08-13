$ ->
  $("nav.site a").each (i,e) ->
    $(e).attr "data-current", true if $(e).text() == $("body").attr "data-page"

  $irc = $(".irc")
  $("body").removeClass "noirc"
  $("iframe", $irc).width $(window).width() - 15

  $(".close", $irc).click ->
    $("body").removeClass "ircopen"
    $("iframe", $irc).hide()
    $(this).hide()
    $(".open", $irc).show()

  $(".open", $irc).click ->
    $("body").addClass "ircopen"
    $("iframe", $irc).show()
    $(this).hide()
    $(".close", $irc).show()

  $(".detach", $irc).click ->
    $("body").removeClass "ircopen"
    $("body").addClass "noirc"
    $irc.remove()
    return true