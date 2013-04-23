Template.addPhotos.events
  "click #takeAphoto" : -> launchCamera()
  "click #chooseFile" : -> selectFile()
  "click #cancel" : -> Session.set "path", "item"

launchCamera = ->
  $('#photoTaken').hide()
  $('#photoOptions').hide()
  window.URL = window.URL || window.webkitURL;
  video = document.querySelector 'video'
  canvas = document.querySelector('canvas');
  ctx = canvas.getContext('2d');
  localMediaStream = null;
  # canvas.width = video.width
  # canvas.height = video.height
  onFailSoHard = (e)-> console.log "Video not loading: ", e

  captureSnapShot = ->
    if localMediaStream
      ctx.drawImage video, 0, 0, canvas.width, canvas.height
      document.querySelector('img').src = canvas.toDataURL 'image/png'
      $("#takePhotoWindow").hide()
      $('#photoTaken').show()
      $('#photoOptions').show()
      $('#tryAgain').on('click', launchCamera)
  

  video.addEventListener 'click', captureSnapShot, false

  $(".addArtContainer").hide()
  $("#takePhotoWindow").show()

  navigator.getUserMedia  = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
  navigator.getUserMedia {video: true}, 
    (stream) ->
      video.src = window.URL.createObjectURL(stream)
      localMediaStream = stream

    onFailSoHard
  

selectFile = ->
  $("#photoFileSelect").click()
  



