photoApp.filter 'potatoDate', ($filter) ->
  (date) ->
    theEndOfTime = 6666
    dateInt      = parseInt(date)

    dateObj = if dateInt < theEndOfTime
                # Date string
                new Date(date)
              else
                # Unix timestamp
                new Date(dateInt * 1000)

    switch dateObj.getDay()
      when 1, 31
        suffix = "'st'"
      when 2
        suffix = "'nd'"
      else
        suffix = "'th'"
    $filter('date') dateObj, "dd" + suffix + " MMM yyyy 'at' HH:mm"