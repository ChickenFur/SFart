Template.main.adminURL = ->
  return Session.get "admin"

Meteor.startup ->
  Backbone.history.start({pushState: true});