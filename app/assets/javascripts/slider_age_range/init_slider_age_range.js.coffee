@init_slider_age_range = ->
  slider_input = $('#slider_age_range')
  minimum = 0
  maximum = 18
  age_min = $('#search_age_min', slider_input.closest('.advanced'))
  age_max = $('#search_age_max', slider_input.closest('.advanced'))
  slider_input.after('<ul class=\'slider_counter\'></ul>')
  slider_counter = slider_input.next('.slider_counter')
  [minimum..maximum].each (index) ->
    slider_counter.append("<li class='item_#{index}'>#{index}</li>")
    console.log index
  $('li:first', slider_counter).addClass('first')
  $('li:last', slider_counter).addClass('last')
  slider_input.slider
    range: true
    min: minimum
    max: maximum
    create: (event, ui) ->
      min_val = minimum
      max_val = maximum
      if age_min.val().isBlank()
        age_min.val(minimum)
      else
        min_val = age_min.val()
      if age_max.val().isBlank()
        age_max.val(maximum)
      else
        max_val = age_max.val()
      $(this).slider('option', 'values', [min_val, max_val])
      true
    change: (event, ui) ->
      values = $(this).slider("option", "values")
      age_min.val(values[0])
      age_max.val(values[1])
      true
  true
