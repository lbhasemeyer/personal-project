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
      $(".select h1").show();
      console.log(clickedCountries);
    },
    onRegionClick: function(element, code, region) {
      $(".country_name").html(region);
      $(".visit_form_country_code").val(code);
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
        window.location.reload(true);
      }
    });
    return false;
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

      $.ajax({
        url: '/country_info/' + code,
        type: "GET",
        success: function(data) {
          console.log(data);
          for (var i=0; i < data.blogs.length; i++) {
            $(".blogs").append("<div>" + data.blogs[i].site + "</div><br>");
          }
          for (var i=0; i < data.comments.length; i++) {
            $(".comments").append("<div>" + data.comments[i].comment + "</div><br>");
          }
          for (var i=0; i < data.photos.length; i++) {
            $(".photos").append("<img src='" + data.photos[i].photo.url + "', class='photo-show'><br>");
          }
        }
      });


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
