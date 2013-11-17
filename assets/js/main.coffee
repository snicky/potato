window.photoApp = angular.module('photoApp',['ngRoute','ngSanitize','truncate'])
  .config ($routeProvider) ->
    $routeProvider.when '/photos',
      templateUrl: '/templates/photoList.html'
      controller:  'photoListController'

    $routeProvider.when '/photo/:photoID',
      templateUrl: '/templates/photo.html'
      controller:  'photoController'

    $routeProvider.otherwise redirectTo: '/photos'