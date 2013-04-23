Session.set "lat", 37.78
Session.set "lng", -122.416
Session.set "nearArtOnly", true

Meteor.autorun =>
  sub = Meteor.subscribe "nearArt", 
                   Session.get("lat"), 
                   Session.get("lng"), 
                   Session.get("nearArtOnly"),
  if sub.ready()
    Session.set "loading", false

  else
    Session.set "loading", true

Template.main.noPath = ->
  if Session.get("path") is ""
    return true
  else
    return false

Template.main.map = ->
  if Session.get("path") is "map"
    return true
  else
    return false
Template.main.admin = ->
  if Session.get("path")  is "admin"
    return true
  else
    return false

Template.main.compass = ->
  if Session.get("path") is "compass"
    return true
  else
    return false

Template.main.item = ->
  if Session.get("path")
    if Session.get("path").indexOf("item") >= 0
      return true
    else
      return false
  else
    return false

Template.main.addPhotos = ->
  if Session.get("path") is "addPhotos"
    return true
  else
    return false
  
#this little statement here makes the back button work when 
#leaving an item and going back to the map view
window.onpopstate= ->
  Session.set "path", window.location.pathname.slice(1)
  

Meteor.startup ->
  Backbone.history.start({pushState: true});
  
 
