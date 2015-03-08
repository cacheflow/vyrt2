angular
  .module('app', ['ngResource'])

 .factory('User', ['$resource', function($resource){
  return $resource('/api/users') 
}]);