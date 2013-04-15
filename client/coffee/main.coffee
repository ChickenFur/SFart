Template.main.map = ->
  if Session.get("path") is "map"
    console.log "returning true"
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

Meteor.startup ->
  Backbone.history.start({pushState: true});
  

