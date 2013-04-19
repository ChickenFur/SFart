Template.main.map = ->
  if Session.get("path") is "map"
    return true
  else
    return false
Template.main.admin = ->
  if Session.get("path") is "admin"
    return true
  else
    return false

Template.main.compass = ->
  if Session.get("path") is "compass"
    return true
  else
    return false

Template.main.item = ->
  if Session.get("path") is "item"
    return true
  else
    return false

#this little statement here makes the back button work when 
#leaving an item and going back to the map view
window.onpopstate= ->
  Session.set "path", window.location.pathname.slice(1)
  

Meteor.startup ->
  Backbone.history.start({pushState: true});
  Session.set "lat", 37.78
  Session.set "lng", -122.416
  Session.set "nearArtOnly", true
  

