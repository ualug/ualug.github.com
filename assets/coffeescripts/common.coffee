$ ->
  $("nav.site a").each (i,e) ->
    $(e).attr "data-current", true if $(e).text() == $("body").attr "data-page"