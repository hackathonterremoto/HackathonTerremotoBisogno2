
/* gestione del tracciamento indirizzo */

navigator.geolocation.getCurrentPosition(gotPosition, errorGettingPosition, { 'enableHighAccuracy': true, 'timeout': 10000, 'maximumAge': 0 });

function gotPosition(pos) {
    //var outputStr = "latitude:" + pos.coords.latitude + "<br>" + "longitude:" + pos.coords.longitude + "<br>" + "accuracy:" + pos.coords.accuracy + "<br>" + "altitude:" + pos.coords.altitude + "<br>" + "altitudeAccuracy:" + pos.coords.altitudeAccuracy + "<br>" + "heading:" + pos.coords.heading + "<br>" + "speed:" + pos.coords.speed + "";
    //crea geocoder per trovare indirizzo

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'latLng': new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude) }, function (results, status) {

        var pannello;
        pannello = document.getElementById('<%= Panel2.ClientID %>');

        if (status == google.maps.GeocoderStatus.OK && pannello != null) {
            if (results[1]) {
                var route = '';
                var number = '';
                var locality = '';
                var sublocality = '';
                for (i = 0; i < results[0].address_components.length; i++) {

                    for (j = 0; j < results[0].address_components[i].types.length; j++) {

                        if (results[0].address_components[i].types[j] == "route")
                            route = results[0].address_components[i].long_name;

                        if (results[0].address_components[i].types[j] == "street_number")
                            number = results[0].address_components[i].long_name

                        if (results[0].address_components[i].types[j] == "locality")
                            locality = results[0].address_components[i].long_name;

                        if (results[0].address_components[i].types[j] == "sublocality")
                            sublocality = results[0].address_components[i].long_name;
                    }

                    document.getElementById('<%= txtProv.ClientID %>').value = sublocality;
                    document.getElementById('<%= txtLocal.ClientID %>').value = locality;

                    if (number != '')
                        document.getElementById('<%= txtIndi.ClientID %>').value = route + ', ' + number;
                    else
                        document.getElementById('<%= txtIndi.ClientID %>').value = route;
                }
            }
            else {
                //alert("No results found");
            }
        } else {
            //alert("Geocoder fallito");
        }
    });
}

function errorGettingPosition(err) {
    if (err.code == 1) {
        alert("User denied geolocation.");
        }
    else if (err.code == 2) {
        alert("Position unavailable.");
        }
    else if (err.code == 3) {
        alert("Timeout expired.");
        }
    else {
        alert("ERROR:" + err.message);
         }
    }

