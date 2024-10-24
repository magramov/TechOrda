# nginx-auth

### Задание

1. Настройте `server` блок, который слушает 8080 порт.
2. Установите `server_name` значению `example.com`.
3. Добавьте `location` блок для пути `/`, который обслуживает файл [index.html](https://stepik.org/media/attachments/lesson/686238/index.html)
4. Добавьте `location` блок для пути `/images`, который обслуживает файлы из архива [cats.zip](https://stepik.org/media/attachments/lesson/686238/cats.zip). Установите авторизованный вход для учетки: `design:SteveJobs1955`, т.е. логин `design`, пароль `SteveJobs1955`.
5. Добавьте `location` блок для пути `/gifs`, который обслуживает файлы из архива [gifs.zip](https://stepik.org/media/attachments/lesson/686238/gifs.zip). Установите авторизованный вход для учетки: `marketing:marketingP@ssword`.
6. Учетка `design` не должна иметь доступ на другие пути, тоже самое касается других учеток.

---
ответ:
server {
    listen 8080;
    server_name example.com;

    # Обработка корневого пути "/"
    location / {
        root /var/lib/nginx/index.html;
        index index.html;
    }

    # Обработка пути "/images" с авторизацией для учетной записи "design"
    location /images {
        root /var/lib/nginx/cats/;
        auth_basic "Restricted Area";
        auth_basic_user_file /etc/nginx/.htpasswd_design;
    }

    # Обработка пути "/gifs" с авторизацией для учетной записи "marketing"
    location /gifs {
        root /var/lib/nginx/gifs;
        auth_basic "Restricted Area";
        auth_basic_user_file /etc/nginx/.htpasswd_marketing;
    }

    # Запрет для учетной записи "design" на доступ к другим путям
    location ~ ^/(gifs|any_other_paths) {
        auth_basic "Access Denied";
        auth_basic_user_file /etc/nginx/.htpasswd_marketing;
    }

    # Запрет для учетной записи "marketing" на доступ к "/images"
    location ~ ^/images {
        auth_basic "Access Denied";
        auth_basic_user_file /etc/nginx/.htpasswd_design;
    }
}
