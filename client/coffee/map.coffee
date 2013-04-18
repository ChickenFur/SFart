# Meteor.autosubscribe -> 
#   Meteor.subscribe("nearArt", 37.78, -122.416, "all", addArtMarkers)


Template.map.rendered = ->
  if !@_rendered
    initializeMap()
  return

#lat: latlong[1], lon: latlong[0]
initializeMap = ->
  mapOptions = {
    center: new google.maps.LatLng( 37.78, -122.416)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    }

  window.map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  window.oms = new OverlappingMarkerSpiderfier(map)
  oms.addListener('click', (marker) -> 
      Session.set "item", marker._id
      Session.set "path", "item"
      history.pushState({map: "map"}, "artItem", "/item/" + marker._id)
  )
  google.maps.event.addListenerOnce(map, 'idle',  ->
    Session.set "mapReady", "true"
    Meteor.subscribe("nearArt", 37.78, -122.416, "", addArtMarkers)
    addArtMarkers()
  )
  return

addArtMarkers = ->
  itemsCursor = artItems.find({},{})
  #itemsCursor.limit = 50
  items = itemsCursor.fetch()
  console.log "Adding this many markers:", items.length 
  for item, i in items
    theLatLng = new google.maps.LatLng(item.loc[1], item.loc[0])
    console.log "lat, long", item.loc[1] + " " + item.loc[0]
    addOneMarker theLatLng, map, item 
  return

addOneMarker = (theLatLng, map, item) ->
    marker = new google.maps.Marker(
        position: theLatLng
        map: map
        title: item.title
        )
    marker._id = item._id
    oms.addMarker(marker)
    # google.maps.event.addListener(
    #     marker, 
    #     'click', 
    #     -> 
    #       Session.set "item", item._id
    #       Session.set "path", "item"
    #       history.pushState({map: "map"}, "artItem", "/item/" + item._id)
    #       )
    return

