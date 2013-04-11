sfartRouter = Backbone.Router.extend ({
  routes: {
    "admin": "admin",
    "map": "map",
    "compass": "compass"
  },
  admin: ->
    Session.set "path", "admin"
    console.log "admin path set"
  map: ->
    Session.set "path", "map"
    console.log "map path set"
  compass: ->
    Session.set "path", "compass"
    console.log "compass path set"
    
})
    
Router = new sfartRouter