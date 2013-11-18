window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

setupEvent = ->

$ ->
  setupEvent()
  $("article .summary").find('a').each (idx, elem) ->
    $(elem).attr("target", "_blank")

  $(".aside img").on "click", (e) ->
    e.preventDefault()
    $(this).parent(".aside").toggleClass("stretch")