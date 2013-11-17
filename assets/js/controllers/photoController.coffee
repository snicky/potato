photoApp.controller 'photoController', ($scope,photoData,$routeParams,$filter) ->

  getPhotoSRC = (photo) ->
    src = "http://farm{farm}.static.flickr.com/" + 
          "{server}/{id}_{secret}.{originalformat}"
    keys = src.match(/\{(\w+)\}/g)
    i = 0

    while i < keys.length
      key  = keys[i]
      prop = photo[key.slice(1, -1)]
      prop = 'jpg' if key == '{originalformat}' && prop is undefined
      src = src.replace(key, prop)
      i++
    src

  photoData.getPhoto($routeParams.photoID).then ((data) ->
    $scope.photo      = data.photo
    $scope.photoTitle = data.photo.title._content
    $scope.photoDesc  = data.photo.description._content
    $scope.photoURL   = data.photo.urls.url[0]._content
    $scope.photoSRC   = getPhotoSRC(data.photo)
    $scope.photoTags  = data.photo.tags.tag
  ), (error) ->
    console.log error

