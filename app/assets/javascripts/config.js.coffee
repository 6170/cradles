window.app =
  Models: {}
  Views: {}
  Collections: {}
  Routers: {}
  log: (msg) ->
    console.log msg
  init: ->
    #if a router exists that matches the name of the current controller we launch it.
    if @Routers[gon.params.controller]
      @log "Router exists for #{gon.params.controller}"
      new @Routers[gon.params.controller]
    else
      @log "No Router exists for #{gon.params.controller}"

$(document).ready ->
  window.app.init()