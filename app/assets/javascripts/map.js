// private map
$(document).ready(function() {
  $(".row.info").hide();

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
      $(".select h1").hide();
      console.log(clickedCountries);
    },
    onRegionDeselect: function(event, code, region) {
      console.log("deselect");
        var index = clickedCountries.indexOf(code);
        if (index !== -1) {
          clickedCountries.splice(index, 1);
        }
      $(".country_name").html("COUNTRY");
      $(".row.info").hide();
      $(".select h1").show();
      console.log(clickedCountries);
    },
    onRegionClick: function(element, code, region) {
      $(".row.info").show();
      $(".country_name").html(region);
    }
  });

//ajax calls for private map - save countries and set clicked countries on load
  $('#ajax-get').click(function(){
    $.ajax({
      url: '/private_maps',
      type: "POST",
      data: {countries: clickedCountries},
      success: function() {
        alert("Countries Saved!");
      }
    })
  });

  $.ajax({
    url: '/clicked',
    type: "GET",
    success: function(data) {
      $.each(data, function( index, value ) {
        clickedCountries.push(value);
        $('#vmap').vectorMap('select', value);
      });
    }
  });

});



// public map
$(document).ready(function() {
  $(".information").hide();
  $('#vmap2').vectorMap({
    map: 'world_en',
    hoverColor: '#d3d3d3',
    selectedColor: 'orange',
    onRegionClick: function(event, code, region) {
      $(".information").show();
      $(".country_name").html(region);
      console.log(code);
    },
    onRegionSelect: function(event, code, region) {
      $(".select").hide();
    },
    onRegionDeselect: function(event, code, region) {
      $(".information").hide();
      $(".select").show();
    }
  });
});
