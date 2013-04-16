Template.item.title = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  return item.title
Template.item.artist = -> 
  item = artItems.find({_id: Session.get("item")}).fetch()[0]
  return item.artist