angular
  .module('app')
  .controller('usersController', ['$scope', 'User',
    function($scope, User) {
    User.query(function(json){

    $scope.users = json;
  });

  }]);
