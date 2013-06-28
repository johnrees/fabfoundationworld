jQuery ->

  $('input.boolean').change ->
    $(this).parents('tr').find('.times').toggle !$(this).is(':checked')
  .trigger 'change'

  $('a#apply-to-all').click (e) ->
    e.preventDefault()
    $('.day').each ->
      $(this).find('.start_time').val $('.day0 .start-time').val()
      $(this).find('.end-time').val $('.day0 .end-time').val()

  $("#geocomplete").geocomplete
    map: "#map"
    details: ".details"
    detailsAttribute: "data-geo"
    markerOptions:
      draggable: true
  .bind "geocode:result", (event, result) ->
    console.log result.address_components
    console.log $(result.adr_address).find('span.country-name').get(0)#.text()

  $("#geocomplete").bind "geocode:dragged", (event, latLng) ->
    $("input#lab_latitude").val latLng.lat()
    $("input#lab_longitude").val latLng.lng()

  # move sunday to the bottom
  $('#opening_hours tbody').append $(this).find('tr:first')