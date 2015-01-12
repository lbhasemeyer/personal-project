$(document).ready(function() {

    var clickedCountries = [];

    $('#vmap').vectorMap({
        map: 'world_en',
        hoverColor: '#d3d3d3',
        selectedColor: 'orange',
        multiSelectRegion: true,
        onRegionClick: function () {
          console.log("onRegionClick");
        },
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
          console.log(clickedCountries);
        }
    });

});





// $(document).ready(function() {
//
//   var clickedCountries = [];
//
//   $('#vmap').vectorMap({
//     map: 'world_en',
//     hoverColor: '#d3d3d3',
//     selectedColor: 'orange',
//     multiSelectRegion: true,
//     onRegionClick: function () {
//       console.log("onRegionClick");
//     },
//     onRegionDeselect: function () {
//       console.log("deselect");
//       // jQuery('#vmap').vectorMap('set', 'colors', code, 'white');
//     },
//     onRegionSelect: function(event, code, region) {
//       console.log("select");
//       // jQuery('#vmap').vectorMap('set', 'colors', code, 'orange');
//       // var index = clickedCountries.indexOf(code);
//       // if (index === -1) {
//       //   clickedCountries.push(code);
//       // }
//       // else {
//       //   jQuery('#vmap').vectorMap('set', 'colors', code, 'white');
//       //   clickedCountries.splice(index, 1);
//       // }
//       // return false;
//     }
//   });
//
// });
