TuttiFrutti
===========

Tutti Frutti Russia - корпоративный веб-сайт



### Запуск
```
# Если не установлен postgresql
brew install postgresql
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# Редактируем config/database.yml - меняем юзера на свой юзернейм

bundle
rake db:create:all db:migrate db:seed
unicorn
```
