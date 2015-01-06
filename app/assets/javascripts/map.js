$(document).ready(function() {

  var clickedCountries = []

  var changeCountryColor = function(code){
    var toChange = {};
    toChange[code] = 'orange';

    jQuery('#vmap').vectorMap('set', 'colors', toChange);

  };

  $('#vmap').vectorMap(
    {
      map: 'world_en',
      hoverColor: '#d3d3d3',
      onRegionClick: function(element, code, region)
      {
        changeCountryColor(code);
        clickedCountries.push(code);
      },
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
    }
  );

});
