Meteor.publish "nearArt", (lat, lng, nearArtOnly) ->
  artItems._ensureIndex({loc : "2d" })
  if nearArtOnly
    return artItems.find( { loc : { $near : [lng, lat] } })
  else
    return artItems.find({ })

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