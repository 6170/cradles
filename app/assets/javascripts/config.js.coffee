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