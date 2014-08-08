lab95 = angular.module('lab95', []).config ($interpolateProvider) ->
  # $interpolateProvider.startSymbol('((').endSymbol('))')

lab95.controller 'ViewCtrl', ($scope) ->
  $scope.sections = [
    title: 'Account'
    options: [
      title: 'Settings'
    ,
      title: 'Statistics'
    ]
  ,
    title: 'Panels'
    options: [
      title: 'mailto.ninja'
    ]
  ]
