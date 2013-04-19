Template.item.title = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  if item
    return item.title
  else
    return "loading"
Template.item.artist = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  if item
    return item.artist
  else
    return "loading"

Template.item.galleryExits = ->
  if not Session.get("loading")
    item = artItems.find({_id: Session.get("item")}).fetch()[0]
    if item.gallery
      return true
    else
      return false
  else
    return true