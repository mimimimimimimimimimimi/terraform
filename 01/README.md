# Ответы на занятие 'Введение в Terraform'

![terraform_version](https://github.com/mimimimimimimimimimimi/terraform/raw/main/01/files/terraform.png)

## Задача 1
2. В файле personal.auto.tfvars, согласно этому .gitignore, допустимо сохранить личную, секретную информацию)

3. "result": "KZOm638rcqgKvQVC",

4. В раскоменченном коде были допущены следующие ошибки:
	- В resource "docker_image"  отстутвовало имя ресурса
	- В resource "docker_container" "1nginx" имя ресурса начиналось с цифры
	- Не правильно были написаны переменные

5. Исправленный фрагмент кода и вывод команды docker ps
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/01/files/5_punkt.png)

6. Вывод команды docker ps после изменения имени контейнера в коде
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/01/files/6_punkt.png)

- Флаг -auto-approve применяет изменения без запроса подтверждения от пользователя. Если в конфиге будут ошибки, то они бдут применены.
- Флаг -auto-approve может быть полезен в скриптах, где не нужно подтверждение.

7. Файл terraform.tfstate после выполнения команды terraform destroy
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/01/files/7_punkt.png)

После выполнения кончено остался файл backup, который я удалил вручную

8. Образе не удалился из за опции keep_locally = true в классификаторе resource docker_image. Опция контролирует, будет ли Terraform удалять локально загруженные образы после их использования.

Та самая строка из документации
![image](https://github.com/mimimimimimimimimimimi/terraform/raw/main/01/files/8_punkt.png)


## Задача 2
