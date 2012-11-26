$(document).ready ->
  $('.typeahead').typeahead
    source: (query, process) ->
      url = @$element.data 'url'
      field = @$element.data 'field'

      $.get url, {query: query}, (data) ->
        process _.pluck data, field