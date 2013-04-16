sfartRouter = Backbone.Router.extend ({
  routes: {
    "admin": "admin",
    "map": "map",
    "compass": "compass",
    "item/:id":"item"
  },
  admin: ->
    Session.set "path", "admin"
    
  map: ->
    Session.set "path", "map"
    
  compass: ->
    Session.set "path", "compass"
    console.log "compass path set"
  item: (id) ->
    Session.set "path", "item"
    Session.set "item", id
    
})
    
Router = new sfartRouter