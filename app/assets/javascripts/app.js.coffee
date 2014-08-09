lab95 = angular.module('lab95', []).config ($interpolateProvider) ->
  # $interpolateProvider.startSymbol('((').endSymbol('))')

lab95.controller 'ViewCtrl', ($scope) ->

  # Default data for new panel
  defaultPanel =
    title: 'New Setting'
    route: ''
    settings: null

  # Set of data and CRUD functions for panels
  $scope.panel = 
    sections: [
      title: 'Defaults'
      options: [
        title: 'Authorized Domains'
        route: 'domains'
        settings:
          color: '#E5E5E5'
          slider:
            min: 0
            max: 100
            value: 5
      ]
    ]
    create: (section) ->
      section.options.push JSON.parse JSON.stringify defaultPanel

    read: ->
    update: ->
    delete: ->
