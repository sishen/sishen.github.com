window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

setupEvent = ->

$ ->
  setupEvent()
  $("article.single").find('a').each (idx, elem) ->
    $(elem).attr("target", "_blank")

  $(".aside img").on "click", (e) ->
    e.preventDefault()
    $(this).parent(".aside").toggleClass("stretch")

  $("#subscribe-cta form").on 'submit', (e) ->
    $.cookie("subscribed", "1")
    $("#subscribe-cta form").css('display', 'none')
    $("#header").css('padding-top', 0)

  if $.cookie('subscribed') is "1"
    $("#subscribe-cta form").css('display', 'none')
    $("#header").css('padding-top', 0)
