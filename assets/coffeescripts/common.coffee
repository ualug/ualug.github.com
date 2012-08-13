$ ->
  $("nav.site a").each (i,e) ->
    $(e).attr "data-current", true if $(e).text() == $("body").attr "data-page"

  $irc = $(".irc")
  $("body").removeClass "noirc"
  $("iframe", $irc).width $(window).width() - 15

  $(".close", $irc).click ->
    $("iframe", $irc).hide()
    $(this).hide()
    $(".open", $irc).show()

  $(".open", $irc).click ->
    $("iframe", $irc).show()
    $(this).hide()
    $(".close", $irc).show()

  $(".detach", $irc).click ->
    $("body").addClass "noirc"
    $irc.remove()
    return true