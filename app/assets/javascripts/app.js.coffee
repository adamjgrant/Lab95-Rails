$('.edit').click ->
  $li = $(this).closest('li')
  $input = $($li).find('input[type="text"]')
  $($li).addClass('edit')
  $($input).focus().select()

  saveInput = (el) ->

    # Update names
    $($li).children('a').html($($input).val())

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
    if e.keyCode == 13
      saveInput this

###
window.lab95 = angular.module('lab95', []).config ($interpolateProvider) ->
  # $interpolateProvider.startSymbol('((').endSymbol('))')
###
