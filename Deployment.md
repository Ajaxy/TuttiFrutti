#### Чтобы развернуть приложение на сервере (на нем уже должны стоять нужные пакеты)
```
ssh-add ~/.ssh/id_rsa – нужно сделать на маке, чтобы заработал Agent Forwarding
cap staging deploy:setup
cap staging deploy:cold deploy:seed
```

#### Чтобы обновить код
```
cap staging deploy
```

Для работы с production сервером все то же, только заменить staging на production.
