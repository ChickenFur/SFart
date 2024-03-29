Template.admin.loggedIN = ->
  if Meteor.user() is null
    console.log "no one is logged in"
    return false
  else
    console.log 
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
#lat: latlong[1], lon: latlong[0]
storeToDB = (items) ->
  for art in items
    latlong = art[2].split ","
    artItems.insert(
      artist: art[0], 
      size: art[1], 
      loc :  [ parseFloat(latlong[0]),  parseFloat(latlong[1]) ],
      locDescription: art[3],
      medium: art[4],
      source: art[5],
      title: art[6]
      )
  return
