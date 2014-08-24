window['updateBinder'] = (id, str, useValue) ->
  $binder = $("[data-app-bind=#{id}]")
  if useValue
    $($binder).val str
  else
    $($binder).html str

ready = ->
  if typeof $.fn.gridster == 'function'
    $('.panel ul').gridster
      widget_margins: [0, 0]
      widget_base_dimensions: [600, 150]

$(document).ready(ready)
$(document).on('page:load', ready)
