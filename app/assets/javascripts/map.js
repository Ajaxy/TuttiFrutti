function showMap () {
    var map = new ymaps.Map('map', {
            center: [55, 50],
            zoom: 4,
            controls: ['zoomControl', 'fullscreenControl']          //, 'searchControl'
        }),
        clusterer = new ymaps.Clusterer({
            preset: 'islands#greenClusterIcons'
        }),
        geoObjects = {};

    window.map = map;

    $('#tools #spots')
        .on('change', function () {
            var id = $(this).find(':selected').val().match(/\d+/),
                spot = CONTACTS[id];

            if (spot.type == 'city') {
                map.setBounds(spot.bounds, { duration: 300 });
            } else {
                map.setCenter(spot.coords, 14);
                setTimeout(function () {
                    geoObjects[id].balloon.open();
                }, 0);
            }
        })
        .find('option').each(function (i, o) {
            if ($(o).val().match('city')) {
                $(o).css('fontWeight', 'bold');
            } else {
                $(o).css('paddingLeft', '20px').end();
            }
        });

    $('#tools #spots').chosen();

    var currentCity = '';

    $.each(CONTACTS, function (i, contact) {
        if (contact.type == 'city') {
            currentCity = contact.name;
            return;
        }

        var geoObject = new ymaps.Placemark(contact.coords, {
                spot: contact.name,
                city: currentCity,
                iconContent: currentCity,
                balloonContentHead: contact.name,
                balloonContentBody: contact.desc
            }, {
                preset: 'islands#greenStretchyIcon'
//                draggable: true
            });

        // API 2.1-beta fix
        geoObject.events.add('balloonclose', function () {
            geoObject.options.set('preset', 'islands#greenStretchyIcon');
        });

        geoObject.events.add('dragend', function () {
            console.log(geoObject.geometry.getCoordinates());
        });

        geoObjects[i] = geoObject;
        clusterer.add(geoObject);
    });

//    map.setBounds(clusterer.getBounds());
    map.geoObjects.add(clusterer);

    map.events.add('boundschange', function (e) {
        var newZoom = e.get('newZoom');

        if (newZoom == e.get('oldZoom')) return;

        $.each(geoObjects, function (i, geoObject) {
            geoObject.properties.set('iconContent', geoObject.properties.get(newZoom <= 7 ? 'city' : 'spot'));
        });
    });
}