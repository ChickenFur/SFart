sfartRouter = Backbone.Router.extend ({
  routes: {
    "admin":    "admin",
    "map":      "map",
    "compass":  "compass",
    "item/:id": "item",
    "grid":     "grid"
  },
  admin: ->
    Session.set "path", "admin"
  map: ->
    Session.set "path", "map"  
  compass: ->
    Session.set "path", "compass"
  item: (id) ->
    Session.set "item", id
    Session.set "path", "item"
  grid: ->
    Session.set "path", "grid"
    
})
    
Router = new sfartRouter