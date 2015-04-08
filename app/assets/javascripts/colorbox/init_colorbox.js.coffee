@init_link_colorbox = ->
  $('a.colorbox').colorbox
    'opacity': '0.7'
    'maxWidth': '90%'
    'maxHeight': '90%'
    'title': ->
      $(this).attr('title') || $('img', $(this)).attr('alt')

  return
