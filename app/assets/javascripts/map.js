$(document).ready(function() {

  var clickedCountries = [];

  $('#vmap').vectorMap({
    map: 'world_en',
    hoverColor: '#d3d3d3',
    selectedColor: 'orange',
    onRegionClick: function(event, code, region) {
      jQuery('#vmap').vectorMap('set', 'colors', code, 'orange');
      clickedCountries.push(code);
    }
    // onRegionOver: function(event, code)
    // {
    //   if (clickedCountries.includes(code))
    //     {
    //       event.preventDefault();
    //     }
    // },
    // onRegionOut: function(event, code)
    // {
    //   if (clickedCountries.includes(code))
    //     {
    //       event.preventDefault();
    //     }
    //   },
  });

});
