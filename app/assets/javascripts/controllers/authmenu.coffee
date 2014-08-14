lab95.controller 'AuthMenuCtrl', ['$scope', ($scope) ->
  $scope.panel =
    sections: [
      title: 'Get started'
      options: [
        title: 'Sign up free'
        route: 'signup'
      ,
        title: 'Login'
        route: 'login'
      ]
    ]
]
