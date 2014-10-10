# encoding: utf-8

class Contact
  ITEMS = [{
     type:	'city',
     name: 'Выберите адрес:',
     fake: true,
     bounds: [[38.149320689475594, 23.974609375000007], [64.60372145191225, 85.49804687499999]],
     zoom: 4
  }, {
     type:	'city',
     name: 'Москва',
     bounds: [[55.55330655215743, 36.9711884140625], [55.94060540808965, 38.30602728125001]],
     zoom: 10
  }, {
     type:		'spot',
     name:  'АТРИУМ',
     desc:   'Ул. Земляной вал, д. 33<br/>1 этаж<br/>8-905-712-12-63',
     coords: [55.757204053424914, 37.65896642858858]
  }, {
     type:		'spot',
     name:  'ТРЦ "Калейдоскоп"',
     desc:   'Ул. Сходненская, 56<br/>3 этаж, рядом с кинотеатром<br/>8-967-141-07-41',
     coords: [55.85043714956182, 37.44397347094699]
  }, {
     type:		'spot',
     name:  'ТРЦ "РИО" (Дмитровское ш.)',
     desc:   'Дмитровское ш., 163А<br/>2 этаж, рядом с кинотеатром<br/>8-905-712-18-51',
     coords: [55.90906403842613, 37.53915911083899]
  }, {
     type:		'spot',
     name:  'ТРЦ "РИО" (Ленинский пр-т)',
     desc:   'Ленинский пр-т, вл. 109<br/>1 этаж, Атриум<br/>8-495-212-93-27',
     coords: [55.66371679115097, 37.5109549416501]
  }, {
     type:		'spot',
     name:  'Башня "Эволюция"',
     desc:   'Москва-Сити, м. Выставочная,<br/>выход из метро к мосту "Багратион"<br/>8-967-140-93-94',
     coords: [55.74863866451142, 37.541507592588616]
  }, {
     type:		'spot',
     name:  'ТРЦ "Отрада"',
     desc:   '7 км Пятницкого ш., вл. 2<br/>1 этаж<br/>8-919-107-93-20',
     coords: [55.83526292425083, 37.38916699999988]
  }, {
     type:		'spot',
     name:  'Арбат',
     desc:   'Ул. Арбат, д. 45/24<br/>8-905-723-51-18',
     coords: [55.74799627720234, 37.588197499999964]
  }, {
     type:		'spot',
     name:  'ТЦ "Капитолий" (пр-т Вернадского)',
     desc:   'Пр-т Вернадского, д. 6, -1 этаж<br/>8-495-221-81-02',
     coords: [55.69224199991318, 37.52791999999997]
  }, {
     type:		'spot',
     name:  'ТРЦ "Весна"',
     desc:   '84 км. МКАД, 2 этаж, напротив кинотеатра<br/>8-968-383-13-78',
     coords: [55.91282428548291, 37.58404856091115]
  }, {
     type:		'spot',
     name:  'ТРЦ "Золотой Вавилон" (Проспект мира)',
     desc:   'Проспект Мира, 211, корп. 2<br/>8-495-665-14-70',
     coords: [55.84524877683303, 37.66021549999997]
  }, {
     type:		'spot',
     name:  'ТРЦ "Европейский"',
     desc:   'Пл. Киевского вокзала, д. 2<br/>2 и 0 этажи<br/>8-916-501-37-06',
     coords: [55.744673, 37.565514]
  }, {
     type:		'spot',
     name:  '"АФИМОЛЛ Сити"',
     desc:   'Пресненская наб., д. 2,<br/>2 этаж рядом с кафе Шоколадница<br/>8-905-723-50-24',
     coords: [55.748933, 37.538446]
  }, {
     type:		'spot',
     name:  'ТЦ "Охотный Ряд"',
     desc:   'Манежная пл., дом 1, стр. 2,<br/> -3 этаж (левое крыло)',
     coords: [55.755628, 37.614436]
  }, {
     type:	'city',
     name: 'Красногорск',
     bounds: [[55.81638774700022, 37.312826553247845], [55.84054335991312, 37.396253982447064]],
     zoom: 14
  }, {
     type:		'spot',
     name:  'ТРЦ "Вегас-2"',
     desc:   'г. Красногорск, 65-66 км. МКАД, 3 этаж, фуд-корт<br/>8-903-205-75-13',
     coords: [55.822218985379706, 37.38642041796843]
  }, {
     type:	'city',
     name: 'Самара',
     bounds: [[53.13845571593492, 49.991703257770865], [53.3444106927285, 50.472355113239594]],
     zoom: 11
  }, {
     type:		'spot',
     name:  'ТРЦ Мега_Самара',
     desc:   'г. Самара, Московское шоссе 24 км, д. 5<br/>8-927-909-27-45',
     coords: [53.326129, 50.304845]
  }, {
     type:		'spot',
     name:  'ТРЦ Амбар',
     desc:   'г. Самара, Южное шоссе, д. 5<br/>8-917-153-63-08',
     coords: [53.140884, 50.177164]
  }, {
     type:	'city',
     name: 'Сургут',
     bounds: [[61.227627577243794, 73.33962432972022], [61.26897777588616, 73.45978729358744]],
     zoom: 12
  }, {
     type:		'spot',
     name:  'ТРЦ "Сити Молл"',
     desc:   'г. Сургут, Югорский тракт, д. 38<br/>8-915-366-31-25',
     coords: [61.23938, 73.374086]
  }, {
     type:	'city',
     name: 'Грозный',
     bounds: [[43.30321129737056, 45.654995305064624], [43.3345455993744, 45.73842273426384]],
     zoom: 14
  }, {
     type:		'spot',
     name:  'ТРЦ "GRAND PARK"',
     desc:   'г. Грозный, пр-т А. Кадырова, 40<br/>3 этаж, зона кинотеатра<br/>8-965-967-86-96',
     coords: [43.30859083939331, 45.70111524340797]
  }, {
     type:	'city',
     name: 'Владикавказ',
     bounds: [[43.017052912211874, 44.649052883361826], [43.04853541023672, 44.70913436529541]],
     zoom: 14
  }, {
     type:		'spot',
     name:  'Проспект Мира',
     desc:   'г. Владикавказ, Проспект Мира, д. 52<br/>8-8672-53-24-08',
     coords: [43.03437029902008, 44.68184020635988]
  }, {
     type:	'city',
     name: 'Астана (Казахстан)',
     bounds: [[51.11347931931667, 71.36299044719902], [51.16747347730558, 71.52984530559746]],
     zoom: 13
  }, {
     type:		'spot',
     name:  'ТРЦ MEGA Astana',
     desc:   'Коргальджинское шоссе, д. 1, 2 этаж, малый атриум<br/>8-701-888-47-06',
     coords: [51.145215523034246, 71.41335494695954]
  }, {
     type:		'spot',
     name:  'ТРЦ "Хан Шатыр"',
     desc:   'Пр-т Туран, д. 37, 2 этаж,<br/>8-777-000-29-29',
     coords: [51.132399, 71.40372]
  }]
end