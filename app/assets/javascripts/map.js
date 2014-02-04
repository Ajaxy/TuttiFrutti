function showMap () {
    var map = window.map = new ymaps.Map('map', {
            center: [50, 55],
            zoom: 4,
            controls: ['zoomControl', 'fullscreenControl']
        }),
        clusterer = new ymaps.Clusterer({
            preset: 'islands#greenClusterIcons'
        }),
        items = [];

    $.each(CITIES, function (i, city) {
        var item = new ymaps.control.ListBoxItem({
                data: { content: city.name },
                options: { selectOnClick: false }
            });

        item.events.add('click', function () {
            cityList.collapse();
            cityList.data.set('content', city.name);
            map.setBounds(city.bounds, city.zoom, { duration: 300 });
        });

        items.push(item);
    });

    var cityList = new ymaps.control.ListBox({
            data: { content: 'Выбрать город' },
            items: items,
            options: { float: 'right' }
        });

    map.controls.add(cityList);

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

        clusterer.add(geoObject);
    });

//    map.setBounds(clusterer.getBounds());
    map.geoObjects.add(clusterer);
}