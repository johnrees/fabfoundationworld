jQuery ->

  $('.closed').change ->
    $(this).parents('tr').find('.times').toggle !$(this).is(':checked')
  .trigger 'change'
