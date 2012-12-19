TuttiFrutti
===========

Tutti Frutti Russia - корпоративный веб-сайт


### Установка PostgreSQL
```
brew install postgresql
initdb /usr/local/var/postgres -E utf8
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```


### Настройка и запуск
```
cp config/database.example.yml config/database.yml
bundle
rake db:create:all db:migrate db:seed
unicorn
```


Установка под Ubuntu/Linux
------------------------

### Установка PostgreSQL
[Инструкция на сайте PostgreSQL](https://help.ubuntu.com/community/PostgreSQL)

```
sudo apt-get install postgresql
sudo -u postgres createuser --superuser [$USER]
sudo -u postgres psql
postgres=# \password [$USER]
```
`[$USER]` - имя нового пользователя


Настройка и запуск аналогично
