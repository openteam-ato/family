change_location_hash = (object) ->
  return false unless object.attr('id')?
  id = object.attr('id')
  object.attr 'id', ''
  window.location.hash = id
  object.attr 'id', id

sub_info_collapser = () ->
  $('.sub_info_link').on 'click', ->
    link = $(this)
    link.next().slideToggle ->
      link.toggleClass('open')
    return false

@init_collapser = ->
  sub_info_collapser()
  wrapper = $('.need_collapser')

  wrapper.click (event) ->
    $this = $(event.target)

    return false if $this.hasClass('busy')

    if $this.hasClass('slider')
      change_location_hash $this
      $('.slider').not($this).removeClass('open').parent().next('.collapse_item').slideUp 'slow'
      $this.addClass('busy').parent().next('.collapse_item').css('margin-top', '10px').slideToggle 'slow', ->
        $this.toggleClass 'open'
        window.location.hash = 'main' if !$this.hasClass('open') && $this.attr('id')?
        $this.removeClass 'busy'
      return false

@hash_handler = ->
  hash = window.location.hash
  if hash.length
    target = $(hash)
    window.scrollTo 0, target.offset().top
    target.click()

