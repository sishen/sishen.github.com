$ ->
  $("article").find('a').each (idx, elem) ->
    $(elem).attr("target", "_blank")