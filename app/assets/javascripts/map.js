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

    $('#tools #cities').on('change', function () {
        var id = $(this).find(':selected').val();

        map.setBounds(CITIES[id].bounds, CITIES[id].zoom, { duration: 300 });
    });

    $('#tools #spots').on('change', function () {
        var id = $(this).find(':selected').val();

        map.setCenter(CONTACTS[id].coords, 14);
        setTimeout(function () {
            geoObjects[id].balloon.open();
        }, 0);
    });

    $.each(CONTACTS, function (i, contact) {
        var geoObject = new ymaps.Placemark(contact.coords, {
                iconContent: contact.title,
                balloonContentHead: contact.title,
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