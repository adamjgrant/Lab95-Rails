updateBinder = (id, str, useValue) ->
  $binder = $("[data-app-bind=#{id}]")
  if useValue
    $($binder).val str
  else
    $($binder).html str

ready = ->
  if typeof $.fn.gridster == 'function'
    $('.panel ul').gridster
      widget_margins: [0, 0]
      widget_base_dimensions: [600, 100]

  # Save panel titles
  $('.acss-sidebar .edit').click ->
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

  # Save Widget information
  $('.widget input[type=text]').click ->
    console.info 'clicked'
    $input = this
    saveInput = (el) ->

      $.ajax
        url: "/panels/#{el.dataset.panelId}/widgets/#{el.dataset.widgetId}"
        data:
          widget:
            name: $($input).val()
        type: "PUT"
        dataType: 'json'
        success: () ->
          A.status
            title: 'Widget updated'

    $(this).keyup (e) ->
      if e.keyCode == 13
        saveInput this

    $(this).blur ->
      saveInput this


$(document).ready(ready)
$(document).on('page:load', ready)
