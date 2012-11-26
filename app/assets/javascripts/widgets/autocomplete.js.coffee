$(document).ready ->
  $('.typeahead').typeahead
    source: (query, process) ->
      url = @$element.data 'url'
      field = @$element.data 'field'

      $.get url, {query: query}, (data) ->
        console.log field
        process _.pluck data, field