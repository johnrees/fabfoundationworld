jQuery ->

  $('.closed').change ->
    $(this).parents('tr').find('.times').toggle !$(this).is(':checked')
  .trigger 'change'

  $('a#apply-to-all').click (e) ->
    e.preventDefault()
    $('.day').each ->
      $(this).find('.start_time').val $('.day0 .start-time').val()
      $(this).find('.end-time').val $('.day0 .end-time').val()

  $("#geocomplete").geocomplete
    map: '#map'
    markerOptions:
      draggable: true

  $("#geocomplete").bind "geocode:dragged", (event, latLng) ->
    $("input#lab_latitude").val latLng.lat()
    $("input#lab_longitude").val latLng.lng()
