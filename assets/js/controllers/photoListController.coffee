photoApp.controller 'photoListController', ($scope, photoData) ->
  photoData.getPhotoList().then ((photos) ->
    $scope.photos = photos
  ), (error) ->
    console.log error

  $scope.viewOnFlickr = (photo) ->
    photoID = photo.link.match(/\/(\d+)\//)[1]
    location.href = "/#/photo/#{photoID}"
