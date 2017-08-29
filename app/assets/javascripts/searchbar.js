var cities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/cities/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});
$('#query').typeahead(null, {
  source: cities
});


