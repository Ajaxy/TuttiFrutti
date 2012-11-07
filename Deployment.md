#### Подготовка
Прежде всего нужно настроить ssh-ключи как сказано описано [здесь](https://help.github.com/articles/generating-ssh-keys).

```
git clone git@github.com:AndreyM/TuttiFrutti.git
cd TuttiFrutti
brew install postgresql
bundle
```

#### Генерация ключей
```
cat ~/.ssh/id_rsa.pub | ssh root@176.58.108.251 'cat >> ~/.ssh/authorized_keys'
ssh-add -K
```

#### Чтобы развернуть приложение на сервере (на нем уже должны стоять нужные пакеты)
```
cap staging deploy:setup
cap staging deploy:cold deploy:seed
```

#### Чтобы обновить код
```
cap staging deploy
```

Для работы с production сервером все то же, только заменить staging на production.
