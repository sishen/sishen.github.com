window.location_pathname = ->
  location.pathname.replace(/index.\w+$/, '')

setupEvent = ->

class GrowingIOScrollTracker
  constructor: (options) ->
    @offset = options.offset || 50
    @markers = (options.markers || @computeMarkers(options.positions, options.names)).sort @compareMarkers
    @event = options.event || 'scrollTrack'
    @page = options.page
    @intervalID = setInterval @tick, 500

  tick: =>
    currentPosition = $(window).scrollTop()

    while @markers.length > 0 && currentPosition >= @markers[0].position
      gio('track', @event, { page: @page, section: @markers[0].value })

      @markers.shift()

    @stopTracking() if @lastMarkerIsReached()

  computeMarkers: (positions, names) ->
    positions.map((position, idx) => { position: @offsetTop(document.getElementById(position)) - @offset, value: names[idx] || position })

  compareMarkers: (a, b) -> a.position >= b.position ? -1 : 1

  lastMarkerIsReached: -> @markers.length == 0

  stopTracking: -> clearInterval @intervalID

  offsetTop: (elem) ->
    if(elem.getBoundingClientRect)
      curtop = elem.getBoundingClientRect().top + document.documentElement.scrollTop
      return curtop
      # body...
    return 0 unless elem.offsetParent
    curtop = elem.offsetTop
    curtop += elem.offsetTop while elem = elem.offsetParent
    curtop

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
