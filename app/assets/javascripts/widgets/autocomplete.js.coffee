$(document).ready ->
  $('.typeahead').typeahead
    source: (query, process) ->
      url = @$element.data 'url'
      console.log url
      $.get url, {query: query}, (data) ->
        process data