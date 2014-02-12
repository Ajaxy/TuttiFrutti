function showMap () {
    var map = window.map = new ymaps.Map('map', {
            center: [50, 55],
            zoom: 4,
            controls: ['zoomControl', 'fullscreenControl']
        }),
        clusterer = new ymaps.Clusterer({
            preset: 'islands#greenClusterIcons'
        }),
        items = [],
        geoObjects = window.geoObjects = {};

    $('#tools #spots')
        .on('change', function () {
            var id = $(this).find(':selected').val().match(/\d+/),
                spot = CONTACTS[id];

            if (spot.type == 'city') {
                map.setBounds(spot.bounds, spot.zoom, { duration: 300 });
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

    $.each(CONTACTS, function (i, contact) {
        if (contact.type == 'city') {
            return;
        }

        var geoObject = new ymaps.Placemark(contact.coords, {
                iconContent: contact.name,
                balloonContentHead: contact.name,
                balloonContentBody: contact.desc
            }, {
                preset: 'islands#greenStretchyIcon'
            });

        // API 2.1-beta fix
        geoObject.events.add('balloonclose', function () {
            geoObject.options.set('preset', 'islands#greenStretchyIcon');
        });

        geoObjects[i] = geoObject;
        clusterer.add(geoObject);
    });

//    map.setBounds(clusterer.getBounds());
    map.geoObjects.add(clusterer);
}