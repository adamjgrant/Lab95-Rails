ready = ->
  # Save Widget name
  $('.widget input[type=text]').click ->
    $input = this
    saveInput = (el) ->
      $.ajax
        url: "/panels/#{$(el).parent()[0].dataset.panelId}/widgets/#{$(el).parent()[0].dataset.widgetId}"
        data:
          widget:
            name: $($input).val()
        type: "PUT"
        dataType: 'json'
        success: ->
          A.status
            title: 'Widget updated'

    $(this).keyup (e) ->
      if e.keyCode == 13
        saveInput this

    $(this).blur ->
      saveInput this

  # Save Widget information
  $('.widget select').change ->
    $select = this
    $.ajax
      url: "/panels/#{$(this).closest('li')[0].dataset.panelId}/widgets/#{$(this).closest('li')[0].dataset.widgetId}"
      data:
        widget:
          input: parseInt $($select).val()
      type: "PUT"
      dataType: 'json'
      success: ->
        A.status
          title: 'Widget updated'

$(document).ready(ready)
$(document).on('page:load', ready)
