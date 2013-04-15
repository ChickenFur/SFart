Template.map.rendered = ->
  initializeMap()

initializeMap = ->
  mapOptions = {
    center: new google.maps.LatLng 37.78, -122.416
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  items = artItems.find().fetch()
  for item in items
    theLatLng = new google.maps.LatLng(item.lat, item.lon)
    marker = new google.maps.Marker({
      position: theLatLng
      map: map
      title: item.title
      })