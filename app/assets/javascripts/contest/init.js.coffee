@init_contest = ->
  list_block = $('.contest_thumbnails')
  info_block = $('.contest_work')
  $('img', list_block).click ->
    return true if $(this).closest('li').hasClass('selected')
    $('li', $(this).closest('ul')).removeClass('selected')
    $(this).closest('li').addClass('selected')
    info_block.html($('.hidden', $(this).closest('li')).html())
    true
  true
