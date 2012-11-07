#### Чтобы развернуть приложение на сервере (на нем уже должны стоять нужные пакеты)
```
ssh-keygen # если еще нет файла ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | ssh root@176.58.108.251 'cat >> ~/.ssh/authorized_keys'
ssh-add -K
```

```
cap staging deploy:setup
cap staging deploy:cold deploy:seed
```

#### Чтобы обновить код
```
cap staging deploy
```

Для работы с production сервером все то же, только заменить staging на production.
