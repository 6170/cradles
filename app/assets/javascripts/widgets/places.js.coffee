class Place extends Backbone.View
  item_tpl: "<p class='multiple-input'><%=name %>  <a href='#' class='remove' data-name='<%=name %>'><i class='icon-remove'></i></a></p>"
  selected_schools: []
  events: 
    'click .remove': 'remove_school'

  remove_school: (ev) ->
    target = $ ev.currentTarget
    school_name = target.data 'name'
    @selected_schools = _.without @selected_schools, school_name
    target.parent().remove()
    @update_schools_field()
    false

  update_schools_field: ->
    $('[name=schools]').val @selected_schools.join '|'
    
  initialize: ->
    #precompile the item template
    @item_tpl = _.template @item_tpl

    #center the map on the users location
    client_location = google.loader.ClientLocation
    @center = new google.maps.LatLng(client_location.latitude, client_location.longitude)
    
    @map = new google.maps.Map @$el.find('#map-box').get(0),
      mapTypeId: google.maps.MapTypeId.ROADMAP
      center: @center
      zoom: 12

    @search()

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
    placeLoc = place.geometry.location
    marker = new google.maps.Marker
      map: @map
      position: place.geometry.location
      title: place.name


    google.maps.event.addListener marker, "click", =>
      #TODO - change marker color
      @$('.js-items-holder').append @item_tpl place
      @selected_schools.push place.name
      @update_schools_field()


$(document).ready ->
  maps = $('.js-map-input')
  if maps.length
    new Place
      el: maps
