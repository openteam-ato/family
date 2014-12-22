@init_social_provider = ->

  $('.revert_to_draft').click ->
    $('.revert_to_draft_reason').slideToggle('fast')
    return false

  $('.revert_to_draft_send').click ->
    if $('.revert_to_draft_reason textarea').val()
      $.ajax
        url: $('.revert_to_draft').attr('href')
        type: 'POST'
        data: "reason=#{$('.revert_to_draft_reason textarea').val()}"
        success: (data, textStatus, jqXHR) ->
          window.location.reload()

  return
