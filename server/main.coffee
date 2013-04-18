Meteor.publish "nearest", (lat, lng ) ->
  artItems._ensureIndex({loc : "2d" })
  artItems.find( { loc : { $near : [lng, lat] } })
  return artItems.find()

