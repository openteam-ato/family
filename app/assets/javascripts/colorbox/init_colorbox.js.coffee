@init_colorbox = ->
  original_img = $('.right_side .entry_image img').attr('src').replace(/\d+-\d+\//, '')
  $('.right_side .entry_image img').wrap("<a class='colorbox' href='#{original_img}' />")
  description = $('.right_side .entry_image .description').html()
  $('.right_side .entry_image .colorbox').colorbox
    'opacity': '0.7'
    'title': description
    'maxWidth': '90%'
    'maxHeight': '90%'

  return

@init_colorbox = ->
  $('a.colorbox').colorbox
    'opacity': '0.7'
    'maxWidth': '90%'
    'maxHeight': '90%'
    'title': ->
      $(this).attr('title') || $('img', $(this)).attr('alt')

  return
