angular
  .module('app')
  .controller('usersController', ['$scope', 'User',
    function($scope, User) {
    $scope.users = User.query();
  }]);
