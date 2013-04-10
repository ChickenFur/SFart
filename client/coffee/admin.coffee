Template.admin.loggedIN = ->
  if Meteor.user() is null
    return false
  else
    return true
Template.admin.rendered = ->
  if Meteor.user()
    document.getElementById('file').addEventListener 'change', handleFileSelect, false

handleFileSelect = (evt) ->
  console.log "file selected"
  files = evt.target.files
  reader = new FileReader();
  reader.onloadend = (theFile) ->
    artItems = $.csv.toArrays(theFile.currentTarget.result)
    storeToDB artItems
  reader.readAsText(files[0])
  return

storeToDB = (items) ->
  for art in items
    latlong = art[2].split ","
    artItems.insert(
      artist: art[0], 
      size: art[1], 
      lat: latlong[1],
      lon: latlong[0],
      locDescription: art[3],
      medium: art[4],
      source: art[5],
      title: art[6]
      )
  return
