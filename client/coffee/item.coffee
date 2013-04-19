Template.item.title = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  if item
    return item.title
  else
    return "loading"
Template.item.artist = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  if item
    return item.artist
  else
    return "loading"

Template.item.galleryExits = ->
  if not Session.get("loading")
    item = artItems.find({_id: Session.get("item")}).fetch()[0]
    if item.gallery
      return true
    else
      return false
  else
    return true

Template.item.rendered = ->
  if not Session.get("loading")
    if !@_rendered
      initializeMap()
    return

initializeMap = ->
  mapOptions = 
    center: new google.maps.LatLng( Session.get("lat"), Session.get("lng"))
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
  directionMap = new google.maps.Map document.getElementById("mapToItem"), mapOptions
  google.maps.event.addListenerOnce directionMap, 'idle',  ->
    drawRoute(directionMap)
    
drawRoute = (directionMap)-> 
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(directionMap)
  directionsService = new google.maps.DirectionsService();

  currentPos = new google.maps.LatLng(Session.get("lat"), Session.get("lng"))
  item = artItems.findOne({_id: Session.get("item")})
  itemPos = new google.maps.LatLng(item.loc[1], item.loc[0])
  request = 
    origin: currentPos
    destination: itemPos
    travelMode:  google.maps.TravelMode.WALKING

  directionsService.route(request, (result, status) ->
    if status is google.maps.DirectionsStatus.OK
      directionsDisplay.setDirections result



    )