TuttiFrutti
===========

Tutti Frutti Russia - корпоративный веб-сайт



### Запуск
```
# Если не установлен postgresql
brew install postgresql
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# Редактируем config/database.yml - меняем юзера на свой системный юзернейм

bundle
rake db:create:all db:migrate db:seed
unicorn
```
