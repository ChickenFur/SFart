Meteor.publish "nearArt", (lat, lng, limit) ->
  artItems._ensureIndex({loc : "2d" })
  #artItems.find({_id : "Ez6BvSXCKTCRS2pXG"})
  if limit is "all"
    return artItems.find({ })
  else
    return artItems.find( { loc : { $near : [lng, lat] } })

Meteor.methods({
  length: ->
    return artItems.find({}).fetch().length
  })

artItems.allow({
  insert: ->
    return true
  update: ->
    return true
  remove: ->
    return true
   
  })