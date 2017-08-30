 var map;
  var infowindow;
  google.maps.event.addDomListener(window, "load", function () {

  var latlng = new google.maps.LatLng(34,-117.5);
  map = new google.maps.Map(document.getElementById('map_canvas'), {
    zoom: 8,
    center: latlng,
    zoomControl: true,
    scaleControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  infoWindow = new google.maps.InfoWindow();
  });


  function getLocation() {
  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 300
  };
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition,errorPostion,options );
  }
  var output = document.getElementById("out");
  output.value = "Recherche...";
  }
  function showPosition(position) {
      var lat=position.coords.latitude;
      var lng=position.coords.longitude;
      var point = new google.maps.LatLng(lat, lng);
    map.panTo(point);
      findAddress(point);
  }
  function errorPostion(error) {
     switch(error.code) {
          case error.PERMISSION_DENIED:
              errorMessage = "User denied the request for Geolocation."
              break;
          case error.POSITION_UNAVAILABLE:
              errorMessage = "Location information is unavailable."
              break;
          case error.TIMEOUT:
              errorMessage = "The request to get user location timed out."
              break;
          case error.UNKNOWN_ERROR:
              errorMessage = "An unknown error occurred."
              break;
      }
      alert("Error : " + errorMessage);


  }

  function findAddress(point) {
  var geocoder = new google.maps.Geocoder();
    geocoder.geocode({latLng: point}, function(results, status) {

      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          var output = document.getElementById("out");
          output.value = "Trouvé !";
          document.getElementById('address').value=results[0].formatted_address;
          document.getElementById('postal_code').value=results[0].address_components[6].long_name;
          document.getElementById('city').value=results[0].address_components[2].long_name;
        }
      }
    });

  }


