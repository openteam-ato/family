@init_actual_slider = ->
  actual = $(".actual_wrapper")
  inner = $(".actual_slider", actual).css
    "padding-bottom": "35px"
  list = $("ul", inner).css
    "position": "relative"
  $("li", list).hide().css
    "position": "absolute"
    "top": 0
    "left": 0
  list_width = 0
  list_height = 0
  list_item_width = $(".clearfix", actual).width()
  $("<div class='switcher'></div>").appendTo(inner)
  switcher = $(".switcher", inner)
  $("li", actual).each (index, item) ->
    $(this).width(list_item_width).addClass("item_#{index}")
    list_width += $(this).outerWidth(true, true)
    list_height = $(this).outerHeight(true, true) if list_height < $(this).outerHeight(true, true)
    $("<span id='item_#{index}'>#{index}</span>").appendTo(switcher)
  $("span:first", switcher).addClass("active")
  $("li:first", list).show()
  $("li", actual).height(list_height)
  $("ul", actual).css
    "width": list_width
    "height": list_height
  $("span", switcher).click ->
    return false if $(this).hasClass("active")
    $("span", switcher).removeClass("active")
    $(this).addClass("active")
    change_slide("li.#{$(this).attr("id")}")
  timer()
  true

change_slide = (target) ->
  clearInterval(@timeout_interval)
  $("li:visible", $(target).closest("ul")).stop(true, true).fadeOut()
  $(target).stop(true, true).fadeIn ->
    timer()

auto_change = ->
  active_dot = $(".actual_wrapper .switcher .active")
  next_dot = if active_dot.next().length then active_dot.next() else $(".actual_wrapper .switcher span:first")
  next_item = $(".actual_wrapper ul li.#{next_dot.attr("id")}")
  active_dot.removeClass("active")
  next_dot.addClass("active")
  change_slide(next_item)

timer = ->
  @timeout_interval = setTimeout(auto_change, 15000)
