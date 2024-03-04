# Ответы на занятие 'Основы Terraform. Yandex Cloud'

## Задача 1
2. Ошибки:
- Первая ошибка заключалась в некоретно написанном пути до файла с ключом от сервисного аккаунта.
- Неправильно была написана platforma standarT и не было 4, поставил первую.
- Было указано 1 ядро, хотя нужно использовать количество ядер кртаное двум.

5. Скриншот по shh
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z1.1-5.1.png)

Скриншот вм в yc
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z1.1-5.2.png)

6. Ответы:
- preemptible = true указывает вм должна быть прерываемой или нет. Прерываемые ВМ могут существенно снизить ваши затраты.
- core_fraction=5 означает, что ВМ будет использовать только 5% доступных ресурсов ЦПУ. Это может быть полезно, если вы хотите ограничить инстанс, чтобы он не потреблял слишком много ресурсов

## Задача 2
Изменения в файле и выполнение terradorm plan

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z2.1.png)

## Задача 3
Перенес переменные и изменил значения

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z3.1.png)

Скриншот из YC

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z3.2.png)

## Задача 4
Скриншот выполнения команды terraform output

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z4.1.png)

## Задача 5
Ниже скриншоты выполения 5 задания, для работы разделил name на несколько переменных.

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z5.1.png)

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z5.2.png)

## Задача 6
- Обьединил переменные в единую map-переменную vms_resources и применил, изменений не было. Правильно сделано или нет можно посмотреть в коде.

- Затем сделал map переменную для блока metadata и закоменнтировал не используемые переменные.
После применения ошибок так же не было.
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z6.1.png)

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/02/files/z6.2.png)