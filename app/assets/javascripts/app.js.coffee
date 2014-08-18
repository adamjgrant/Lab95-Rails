$('.edit').click ->
  $li = $(this).closest('li')
  $input = $($li).find('input[type="text"]')
  console.log $input

  $li.addClass 'edit'
  $($input).blur ->
    id = this.dataset.panelId
    user_id = this.dataset.userId
    $.ajax
      url: "/users/#{user_id}/panels/#{id}"
      data:
        name: $input.value
      type: "PATCH"

window.lab95 = angular.module('lab95', []).config ($interpolateProvider) ->
  # $interpolateProvider.startSymbol('((').endSymbol('))')
