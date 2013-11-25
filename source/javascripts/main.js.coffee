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

  $(document).on "scroll", (e) ->
  	top = $(window).scrollTop()
  	ele = $('.announcement')
  	if top > 0
      ele.addClass('sticky')
    else
      ele.removeClass('sticky')