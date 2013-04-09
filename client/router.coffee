sfartRouter = Backbone.Router.extend ({
  routes: {
    "admin": "admin"
  },
  admin: ->
    console.log "Admin Page reached"
})
    
Router = new sfartRouter;