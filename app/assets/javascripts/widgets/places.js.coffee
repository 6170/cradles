class Place extends Backbone.View
  item_tpl: "<p class='multiple-input'><%=name %>  <a href='#' class='remove' data-name='<%=name %>'><i class='icon-remove'></i></a><input type='hidden' value='<%=name %>' name='schools[]'></p>"
  marker_cache: {}
  selected_schools: []
  marker_icon:
    green: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
    default: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
  
  events: 
    'click .remove': 'remove_school'

  remove_school: (ev) ->
    target = $ ev.currentTarget
    name = target.data 'name'
    
    #update marker and selected schools list
    @marker_cache[name]?.setIcon @marker_icon.default
    @selected_schools = _.without @selected_schools, name
    
    #remove element from list
    target.parent().remove()
    false

  add_school: (name) =>
    #dont add if duplicate
    unless _.contains @selected_schools, name
      @item_holder.append @item_tpl 
        name: name

      @selected_schools.push name
    
  initialize: ->
    #precompile the item template
    @item_tpl = _.template @item_tpl
    @item_holder = @$ '.js-items-holder'
    
    #center the map on the users location
    client_location = google.loader.ClientLocation
    @center = new google.maps.LatLng(client_location.latitude, client_location.longitude)
    
    @map = new google.maps.Map @$el.find('#map-box').get(0),
      mapTypeId: google.maps.MapTypeId.ROADMAP
      center: @center
      zoom: 12

    @search()

    #show user's existing schools
    _.each @options.schools, @add_school

  search: ->
    request =
      location: @center
      radius: 50000
      types: ["school"]
      keyword: 'Public School'
    service = new google.maps.places.PlacesService(@map)
    service.nearbySearch request, @callback
  

  callback: (results, status) =>
    if status is google.maps.places.PlacesServiceStatus.OK
      for place in results
        @createMarker place


  createMarker: (place) =>
    marker = new google.maps.Marker
      map: @map
      position: place.geometry.location
      title: place.name
      icon: @marker_icon.default

    @marker_cache[place.name] = marker
    if _.contains @selected_schools, place.name
      marker.setIcon @marker_icon.green



    google.maps.event.addListener marker, "click", =>
      marker.setIcon @marker_icon.green
      @add_school place.name
      
      
      



$(document).ready ->
  maps = $('.js-map-input')
  if maps.length
    new Place
      el: maps
      schools: gon.schools
