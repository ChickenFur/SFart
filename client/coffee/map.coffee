Meteor.autosubscribe -> 
  Meteor.subscribe("nearArt", 37.78, -122.416, "")


Template.map.rendered = ->
  if !@_rendered
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
#lat: latlong[1], lon: latlong[0]
initializeMap = ->
  mapOptions = {
    center: new google.maps.LatLng( 37.78, -122.416)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    }
  map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  google.maps.event.addListenerOnce(map, 'idle',  ->
    itemsCursor = artItems.find({},{})
    itemsCursor.limit = 50
    items = itemsCursor.fetch()
    for item, i in items
      theLatLng = new google.maps.LatLng(item.loc[1], item.loc[0])
      addArtMarker theLatLng, map, item 
    return
  )
  return