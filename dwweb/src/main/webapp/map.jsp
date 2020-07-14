<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="https://d19vzq90twjlae.cloudfront.net/leaflet-0.4.4/leaflet.css" />
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.4.4/leaflet.ie.css" />
        <![endif]-->
        <style>
            #map { width:960px; height:500px; }
        </style>
    </head>
    <body>
        <div id='map'></div>
        <script src="https://d19vzq90twjlae.cloudfront.net/leaflet-0.4.4/leaflet.js"></script>
        <script>
            var map = L.map('map').setView([37.9, -77], 10);

            L.tileLayer('http://a.tiles.mapbox.com/v3/tmcw.map-rep59d6x/{z}/{x}/{y}.png').addTo(map);

            var gj = {
                type: 'FeatureCollection',
                features: [{
                    type: 'Feature',
                    geometry: {
                        coordinates: [-77, 37.9],
                        type: 'Point'
                    },
                    properties: {
                        'marker-color': '#000',
                        'marker-symbol': 'star-stroked',
                        'marker-size': 'large',
                        title: 'Example Marker',
                        description: 'This is a single marker.'
                    }
                }, {
                    type: 'Feature',
                    geometry: {
                        coordinates: [-77.1, 37.8],
                        type: 'Point'
                    },
                    properties: {
                        'marker-color': '#f00',
                        'marker-symbol': 'star',
                        'marker-size': 'small',
                        title: 'Example Marker',
                        description: 'This is a single marker.'
                    }
                }]
            };
            // see http://mapbox.com/developers/api/#markers
            // and http://github.com/mapbox/simplestyle-spec
            (new L.GeoJSON(gj, {
                pointToLayer: function(f, latlon) {
                    var sizes = {
                      small: [20, 50],
                      medium: [30, 70],
                      large: [35, 90]
                    };

                    var fp = f.properties || {};
                    var size = fp['marker-size'] || 'medium';
                    var symbol = (fp['marker-symbol']) ? '-' + fp['marker-symbol'] : '';
                    var color = fp['marker-color'] || '7e7e7e';
                    color = color.replace('#', '');

                    var url = 'http://a.tiles.mapbox.com/v3/marker/' +
                          'pin-' +
                          // Internet Explorer does not support the `size[0]` syntax.
                          size.charAt(0) + symbol + '+' + color +
                          ((window.devicePixelRatio === 2) ? '@2x' : '') +
                          '.png';

                    return new L.Marker(latlon, {
                        icon: new L.icon({
                            iconUrl: url,
                            iconSize: sizes[size],
                            iconAnchor: [sizes[size][0] / 2, sizes[size][1] / 2],
                            popupAnchor: [sizes[size][0] / 2, 0]
                        })
                    });
                }
            })).addTo(map);
        </script>
    </body>
</html>