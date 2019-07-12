window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

setupEvent = ->

class GrowingIOScrollTracker
  constructor: (options) ->
    @markers = options.markers.sort @compareMarkers
    @event = options.event
    @page = options.page
    @intervalID = setInterval @tick, 500

  tick: =>
    currentPosition = $(window).scrollTop()

    while @markers.length > 0 && currentPosition >= @markers[0].position
      gio('track', @event, { page: @page, section: @markers[0].value })

      @markers.shift()

    @stopTracking() if @lastMarkerIsReached()

  compareMarkers: (a, b) -> a.position >= b.position ? -1 : 1

  lastMarkerIsReached: -> @markers.length == 0

  stopTracking: -> clearInterval @intervalID

window.GrowingIOScrollTracker = GrowingIOScrollTracker

$ ->
  setupEvent()
  $("article.single").find('a').each (idx, elem) ->
    $(elem).attr("target", "_blank")

  $(".aside img").on "click", (e) ->
    e.preventDefault()
    $(this).parent(".aside").toggleClass("stretch")

  $(".rss a").on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    $(".subscribe-form form").toggle()
