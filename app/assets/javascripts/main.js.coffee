$ ->
  init_chart()             if $(".chart").length
  init_galleria()          if $("#galleria").length
  init_actual_slider()     if $(".actual li").length > 1
  init_jcarousel()         if $(".banners_block").length
  init_map()               if $("#map").length
  init_tabs()              if $('.tabs').length
  init_scroller()          if $(".calendar .calendar_items").length
  init_upload_files()      if $(".appeal_form").length
  init_archive_collapser() if $(".archive").length
  init_reports_list()      if $("div.reports").length
  init_colorbox()          if $(".right_side .entry_image img").length
  init_uppod()             if $("div.uppod").length
  init_datepicker()

  if $(".need_collapser").length
    init_collapser()
    hash_handler()
  $("a.invalid_link").click =>
    return false

