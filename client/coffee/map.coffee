Template.map.rendered = ->
  initializeMap()


addArtMarker = (theLatLng, map, item) ->
  marker = new google.maps.Marker(
      position: theLatLng
      map: map
      title: item.title
      )
  google.maps.event.addListener(
      marker, 
      'click', 
      -> 
        Session.set "path", "item"
        Session.set "item", item._id
        Template.item.id = -> item._id
        Template.item.title = -> item.title
        Template.item.artist = -> item.artist )
  return

initializeMap = ->
  mapOptions = {
    center: new google.maps.LatLng( 37.78, -122.416)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    }
  
  map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  items = artItems.find().fetch()
  for item, i in items
    theLatLng = new google.maps.LatLng(item.lat, item.lon)
    addArtMarker theLatLng, map, item 

  return




    