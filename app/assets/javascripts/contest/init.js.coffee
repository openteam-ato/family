@init_contest = ->
  list_block = $('.contest_thumbnails')
  info_block = $('.contest_work')

  $('.to_left', info_block.closest('.contest_work_wrapper')).click ->
    prev = $('.selected', list_block).prev()
    prev = $('li:last', list_block) unless prev.length
    $('img', prev).click()
    false

  $('.to_right', info_block.closest('.contest_work_wrapper')).click ->
    next = $('.selected', list_block).next()
    next = $('li:first', list_block) unless next.length
    $('img', next).click()
    false

  $('img', list_block).click ->
    return true if $(this).closest('li').hasClass('selected')
    $('li', $(this).closest('ul')).removeClass('selected')
    $(this).closest('li').addClass('selected')
    info = $('.hidden', $(this).closest('li')).html()
    info_block.html(info)

    false

  true
