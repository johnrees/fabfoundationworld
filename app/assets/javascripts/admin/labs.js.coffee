jQuery ->

  $('.closed').change ->
    $(this).parents('tr').find('.times').toggle !$(this).is(':checked')
  .trigger 'change'

  $('a#apply-to-all').click (e) ->
    e.preventDefault()
    $('.day').each ->
      $(this).find('.start_time').val $('.day0 .start-time').val()
      $(this).find('.end-time').val $('.day0 .end-time').val()