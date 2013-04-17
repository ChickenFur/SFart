Template.map.rendered = ->
  initializeMap()
  return


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
        Session.set "item", item._id
        Session.set "path", "item"
        history.pushState({map: "map"}, "artItem", "/item/" + item._id)
        )
  return

initializeMap = ->
  mapOptions = {
    center: new google.maps.LatLng( 37.78, -122.416)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    }
  
  map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  
  items = artItems.find().fetch()
  

  delay = (ms, func) -> setTimeout func, ms

  addAllMarkers = -> 
    for item, i in items
      theLatLng = new google.maps.LatLng(item.lat, item.lon)
      addArtMarker theLatLng, map, item 

  delay 1000, addAllMarkers
    
  return


  



    