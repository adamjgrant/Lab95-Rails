lab95.controller 'SidebarCtrl', ['$scope', ($scope) ->
  $scope.panel = null

  if false
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
        # Default data for new panel
        defaultPanel =
          title: 'New Setting'
          route: ''
          settings: null
          edit: true

        section.options.push defaultPanel

      read: ->
      update: ->
      delete: ->
]
