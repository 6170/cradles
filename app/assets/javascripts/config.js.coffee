GOOGLE_API_KEY = 'AIzaSyCM7JCAgxedvS2mQiWZXHQ8gFgVVbnb2Yw'

window.app =
  Models: {}
  Views: {}
  Collections: {}
  Routers: {}
  pubsub: _.extend {}, Backbone.Events
  log: (msg) ->
    console.log msg
  init: ->


$(document).ready ->
  window.app.init()