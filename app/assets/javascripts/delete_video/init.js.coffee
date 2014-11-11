@init_delete_video = ->

  $('.delete_video').click ->
    $(this).closest('p').prev('p').hide()
    $(this).closest('p').html('<input type="hidden" name="child[delete_video]" value="true" />Видео будет удалено после сохранения анкеты')

    false

  return
