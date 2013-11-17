photoApp.factory 'photoData', ($http, $q) ->

  apiKey       = 'bc2a316f11bf322267038ac6e07ff128'
  apiURL       = 'http://api.flickr.com/services/'
  apiFormat    = '&format=json&jsoncallback=JSON_CALLBACK'
  photoListURL = apiURL + "feeds/photos_public.gne?tags=potato&tagmode=all#{apiFormat}"

  getPhotoURL  = (photoID) ->
    'http://api.flickr.com/services/rest/' + 
    '?method=flickr.photos.getInfo'        + 
    "&api_key=#{apiKey}"                   + 
    "&photo_id=#{photoID}"                 + 
    apiFormat

  getPhotoList: ->
    deferred = $q.defer()
    $http.jsonp(photoListURL).success((data) ->
      deferred.resolve data
    ).error (_, status) ->
      deferred.reject status

    deferred.promise

  getPhoto: (photoID) ->
    deferred = $q.defer()
    $http.jsonp(getPhotoURL(photoID)).success((data) ->
      deferred.resolve data
    ).error (status) ->
      deferred.reject status

    deferred.promise
