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
    debugger
  reader.readAsText(files[0])
  return