//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
  if(animating) return false;
  animating = true;

  current_fs = $(this).parent();
  next_fs = $(this).parent().next();

  //activate next step on progressbar using the index of next_fs
  $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

  //show the next fieldset
  next_fs.show();
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale current_fs down to 80%
      scale = 1 - (1 - now) * 0.2;
      //2. bring next_fs from the right(50%)
      left = (now * 50)+"%";
      //3. increase opacity of next_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({
        'transform': 'scale('+scale+')',
        'position': 'absolute'
      });
      next_fs.css({'left': left, 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    }//,
    //this comes from the custom easing plugin
    // easing: 'easeInOutBack'
  });
});

$(".previous").click(function(){
  if(animating) return false;
  animating = true;

  current_fs = $(this).parent();
  previous_fs = $(this).parent().prev();

  //de-activate current step on progressbar
  $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

  //show the previous fieldset
  previous_fs.show();
  //hide the current fieldset with style
  current_fs.animate({opacity: 0}, {
    step: function(now, mx) {
      //as the opacity of current_fs reduces to 0 - stored in "now"
      //1. scale previous_fs from 80% to 100%
      scale = 0.8 + (1 - now) * 0.2;
      //2. take current_fs to the right(50%) - from 0%
      left = ((1-now) * 50)+"%";
      //3. increase opacity of previous_fs to 1 as it moves in
      opacity = 1 - now;
      current_fs.css({'left': left});
      previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
    },
    duration: 800,
    complete: function(){
      current_fs.hide();
      animating = false;
    },
    //this comes from the custom easing plugin
    // easing: 'easeInOutBack'
  });
});

$(".soumettre").click(function(){
  return false;
})



    var flat_address = document.getElementById('address');
    if (flat_address) {
      var autocomplete = new google.maps.places.Autocomplete(flat_address, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
      google.maps.event.addDomListener(flat_address, 'keydown', function(e) {
        if (e.keyCode == 13) {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    function onPlaceChanged() {
      var place = this.getPlace();
      var components = getAddressComponents(place);

      var flatAddress = document.getElementById('address');
      flatAddress.blur();
      flatAddress.value = components.address;

      document.getElementById('postal_code').value = components.zip_code;
      document.getElementById('city').value = components.city;

      if (components.country_code) {
        var selector = '#flat_country option[value="' + components.country_code + '"]';
        document.querySelector(selector).selected = true;
      }
    }

    function getAddressComponents(place) {

      if (window.console && typeof console.log === "function") {
        console.log(place);
      }

      var street_number = null;
      var route = null;
      var zip_code = null;
      var city = null;
      var country_code = null;
      for (var i in place.address_components) {
        var component = place.address_components[i];
        for (var j in component.types) {
          var type = component.types[j];
          if (type === 'street_number') {
            street_number = component.long_name;
          } else if (type === 'route') {
            route = component.long_name;
          } else if (type === 'postal_code') {
            zip_code = component.long_name;
          } else if (type === 'locality') {
            city = component.long_name;
          } else if (type === 'postal_town' && city === null) {
            city = component.long_name;
          } else if (type === 'country') {
            country_code = component.short_name;
          }
        }
      }

      return {
        address: street_number === null ? route : (street_number + ' ' + route + ', ' + city + ', ' + country_code),
        zip_code: zip_code,
        city: city,
      };
    }







