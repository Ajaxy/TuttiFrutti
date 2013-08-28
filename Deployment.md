#### Подготовка
Прежде всего нужно настроить ssh-ключи как описано [здесь](https://help.github.com/articles/generating-ssh-keys).

```
git clone git@github.com:AndreyM/TuttiFrutti.git
cd TuttiFrutti
brew install postgresql
bundle
```

#### Добавляем свой публичный ключ на сервер в ~/.ssh/authorized_keys
```
cat ~/.ssh/id_rsa.pub | ssh root@176.58.108.251 'cat >> ~/.ssh/authorized_keys'
ssh-add -K
```

#### Чтобы развернуть приложение на сервере (на нем уже должны стоять нужные пакеты)
```
cap production deploy:setup
cap production deploy:cold deploy:seed
```

#### Чтобы обновить код
```
cap production deploy
```
