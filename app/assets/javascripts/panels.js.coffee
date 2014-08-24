ready = ->
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

$(document).ready(ready)
$(document).on('page:load', ready)
