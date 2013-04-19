Template.map.rendered = ->
  if !@_rendered
    initializeMap()
  return
Template.map.near = ->
  console.log Session.get "nearArtOnly"
  return Session.get "nearArtOnly"

Template.map.events
  'click #showAll': (event) -> Session.set "nearArtOnly", false 
      

initializeMap = ->
  mapOptions = 
    center: new google.maps.LatLng( 37.78, -122.416)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
  window.map = new google.maps.Map document.getElementById("map-canvas"), mapOptions
  window.oms = new OverlappingMarkerSpiderfier(map)
  oms.addListener 'click', (marker) -> 
      Session.set "item", marker._id
      Session.set "path", "item"
      history.pushState({map: "map"}, "artItem", "/item/" + marker._id)
  
  google.maps.event.addListenerOnce map, 'idle',  ->
    
    Meteor.autorun =>
      addArtMarkers() if not Session.get "loading"
  return

addArtMarkers = ->
  items = artItems.find().fetch()
  console.log "Adding this many markers:", items.length 
  for item, i in items
    theLatLng = new google.maps.LatLng(item.loc[1], item.loc[0])
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
  return


