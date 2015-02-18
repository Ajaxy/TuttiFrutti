# encoding: utf-8

PAGES = {
  'О нас'                 => :about,
  'Вкусы'                 => :tastes,
  'Карта Тутти Фрутти'    => :card,
  'Карьера'               => :career,
  'Международный сайт'    => 'http://tfyogurt.com/',
  'Сотрудничество'        => {
      'Франшиза'              => :franchising,
      'Торговым центрам / брокерам '  => :renters
  },
  'Адреса кафе'              => :contact,
}

SUBPAGES = {
  career: {
    #'manager'   => 'Управляющий кафе',
    'worker'    => 'Сотрудник кафе',
    'foreman'   => 'Старший смены',
  },
  tastes: {
    ''        => 'Вкусы',
    'topings' => 'Топинги',
    'top/12'  => 'TOP-12',
    'foodenergy'  => 'БЖУ и Kкал',
  }
}

