!function(){

  var map;

  var centerChanged = function(){
    clearTimeout(centerChanged.timeout);
    centerChanged.timeout = setTimeout(refreshMarkers, 300);
  }

  var refreshMarkers = function(){
    var bounds = map.getBounds();
    var northEast = bounds.getNorthEast();
    var southWest = bounds.getSouthWest();

    var data = {
      sw_latitude:  southWest.lat(),
      sw_longitude: southWest.lng(),
      ne_latitude:  northEast.lat(),
      ne_longitude: northEast.lng(),
    };
    console.log(data)
    var request = $.getJSON('/yelp_search', data);
    request.done(function(response){
      drawBusinesses(response.businesses);
    });
  }

  var drawBusinesses = function(businesses){
    businesses.forEach(function(businesse){
      var coordinate = businesse.location.coordinate;
      var marker = new google.maps.Marker({
         position: {
           lat: coordinate.latitude,
           lng: coordinate.longitude,
         },
         map: map,
         title: businesse.name,
      });

      google.maps.event.addListener(marker, 'click', function() {
        console.log('CLICKED ON', businesse);
      });

    });
  }

  $(function(){

    navigator.geolocation.getCurrentPosition(function(position){

      map = new google.maps.Map($('#map-canvas')[0], {
        center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });

      setTimeout(refreshMarkers, 1000);

      google.maps.event.addListener(map, 'center_changed', function() {
        centerChanged();
      });

    });

  });

}();