$ ->
  $("nav.site a").each (i,e) ->
    $(e).attr "data-current", true if $(e).text() == $("body").attr "data-page"

  $irc = $(".irc")
  $("body").removeClass "noirc"

  $("iframe", $irc).width $(window).width() - 15
  $(window).on 'resize', ->
    $("iframe", $irc).width $(window).width() - 15


  openIrc = ->
    $("body").addClass "ircopen"
    $("iframe", $irc).show()
    $(".open", $irc).hide()
    $(".close", $irc).show()

  closeIrc = ->
    $("body").removeClass "ircopen"
    $("iframe", $irc).hide()
    $(".close", $irc).hide()
    $(".open", $irc).show()

  detachIrc = ->
    $("body").removeClass "ircopen"
    $("body").addClass "noirc"
    $irc.remove()
    return true

  $(".open", $irc).click openIrc
  $(".close", $irc).click closeIrc
  $(".detach", $irc).click detachIrc

  $("nav.social .irc-open").click ->
    if $("body").hasClass "ircopen"
      closeIrc()
    else
      openIrc()