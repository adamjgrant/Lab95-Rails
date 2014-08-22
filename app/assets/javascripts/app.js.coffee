updateBinder = (id, str, useValue) ->
  $binder = $("[data-app-bind=#{id}]")
  if useValue
    $($binder).val str
  else
    $($binder).html str

$('.edit').click ->
  $li = $(this).closest('li')
  $input = $($li).find('input[type="text"]')
  $($li).addClass('edit')
  $($input).focus().select()

  saveInput = (el) ->

    # Revert to view mode
    $($li).removeClass('edit')
    $.ajax
      url: "/panels/#{el.dataset.panelId}"
      data:
        name: $($input).val()
      type: "PUT"
      dataType: 'json'

  $($input).blur ->
    saveInput this

  $($input).keyup (e) ->

    # Update titles in realtime.
    updateBinder "panel-#{$input[0].dataset.panelId}", $($input).val()

    # On enter...
    if e.keyCode == 13
      saveInput this

ready = ->
  console.info 'Calling ready'
  $('.panel ul').gridster
    widget_margins: [10, 10],
    widget_base_dimensions: [150, 150]
    autogenerate_stylesheet: true
    avoid_overlapped_widgets: true

$(document).ready(ready)
$(document).on('page:load', ready)

###
window.lab95 = angular.module('lab95', []).config ($interpolateProvider) ->
  # $interpolateProvider.startSymbol('((').endSymbol('))')
###
