Template.location.location = -> 
    return Session.get "location"

Template.compass.heading = ->
    return Session.get "heading"

getLocation = -> 
  navigator.geolocation.getCurrentPosition(formatText)

formatText = (position) ->
  Session.set "location", "Lat: " + position.coords.latitude + " Lon: " + position.coords.longitude



Meteor.startup ->
  Backbone.history.start({pushState: true});
  
  Session.set "location", "loading"
  Session.set "heading", "loading"
  getLocation()
  window.addEventListener 'deviceorientation', (e) ->
    Session.set "heading", e.webkitCompassHeading