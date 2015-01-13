
// private map
$(document).ready(function() {
  var clickedCountries = [];

  $('#vmap').vectorMap({
    map: 'world_en',
    hoverColor: '#d3d3d3',
    selectedColor: 'orange',
    multiSelectRegion: true,
    onRegionSelect: function(event, code, region) {
      console.log("select");
      var index = clickedCountries.indexOf(code);
      if (index === -1) {
        clickedCountries.push(code);
      }
      console.log(clickedCountries);
    },
    onRegionDeselect: function(event, code, region) {
      console.log("deselect");
      var index = clickedCountries.indexOf(code);
      if (index !== -1) {
        clickedCountries.splice(index, 1);
      }
      $(".country_name").html("COUNTRY");
      console.log(clickedCountries);
    },
    onRegionClick: function(element, code, region) {
      $(".country_name").html(region);
    }
  });
});




// public map
$(document).ready(function() {
  $('#vmap2').vectorMap({
    map: 'world_en',
    hoverColor: '#d3d3d3',
    selectedColor: 'orange',
    onRegionClick: function(event, code, region) {
      $(".country_name").html(region);
      console.log(code);
    },
    onRegionDeselect: function(event, code, region) {
      $(".country_name").html("COUNTRY");
    }
  });
});
