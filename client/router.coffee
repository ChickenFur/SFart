sfartRouter = Backbone.Router.extend ({
  routes: {
    "admin": "admin"
  },
  admin: ->
    Session.set "admin", true
    console.log "Rendering Admin Page"
})
    
Router = new sfartRouter;