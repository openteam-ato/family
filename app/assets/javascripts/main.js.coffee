$ ->
  init_chart()                if $('.chart').length
  init_galleria()             if $('#galleria').length
  init_actual_slider()        if $('.actual li').length
  init_jcarousel()            if $('.banners_block').length
  init_map()                  if $('#map').length
  init_slider_age_range()     if $('#slider_age_range').length
  init_tabs()                 if $('.tabs').length
  init_scroller()             if $('.calendar .calendar_items').length
  init_upload_files()         if $('.appeal_form').length
  init_archive_collapser()    if $('.archive').length
  init_contest()              if $('.contest_thumbnails').length
  init_contest_votes()        if $('.votes a.vote_link').length
  init_reports_list()         if $('div.reports').length
  init_right_side_colorbox()  if $('.right_side .entry_image img').length
  init_colorbox()             if $('a.colorbox').length
  init_uppod()                if $('div.uppod').length
  init_iframe_resize()        if $('#autoIframe').length
  init_delete_video()         if $('.delete_video').length
  init_datepicker()

  if $('.need_collapser').length
    init_collapser()
    hash_handler()

  $('a.invalid_link, a.disabled').click =>
    return false

  true
