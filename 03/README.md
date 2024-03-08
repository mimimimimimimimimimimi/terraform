# Ответы на занятие 'Основы Terraform. Yandex Cloud'

## Задача 1
1. Вот скриншот входящих правил в созданой сети 

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z1.png)

## Задача 2
- Пришлось немного подумать, чтоб for_each получал данные из переменной, но вроде сделал.
- Для создания сначала ВМок из 2.2 использовал depends_on
- На скриншоте сеть создается заново, так как делал destroy.

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z2.2.png)

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z2.1.png)

## Задача 3
Создал 3 сетевых диска с помощью count

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z3.1.png)

Затем создал ВМ с подключением туда этих созданных дисков

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z3.2.png)

## Задача 4
Были трудности со storage, но покопавшись выяснил, что одиночные нужно оборачивать в квадратные скобки.

Скриншот получившегося файла

![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/03/files/z4.png)

