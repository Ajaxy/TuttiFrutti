TuttiFrutti
===========

Tutti Frutti Russia - корпоративный веб-сайт


### Запуск
```
# Если не установлен postgresql
brew install postgresql
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

psql postgres -c "create user tutti"
cp config/database.example.yml config/database.yml

bundle
rake db:create:all db:migrate db:seed
unicorn
```
