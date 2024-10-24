# nginx-files

Важно знать ключевые файлы, директории и команды NGINX. Научившись этому,
вы сможете изменять конфигурации, проверять измененные настройки,
обращаться к командам NGINX.

### /etc/nginx/

Каталог `/etc/nginx/` является корневым каталогом конфигурации по умолчанию для сервера NGINX.
В этом каталоге вы найдете файлы конфигурации, которые указывают NGINX как себя вести.

### /etc/nginx/nginx.conf

Файл `/etc/nginx/nginx.conf` — это точка входа в конфигурацию по умолчанию, используемая службой NGINX.
Этот файл конфигурации устанавливает глобальные параметры для таких вещей, как рабочий процесс,
тюнинг, ведение журнала, загрузка динамических модулей и ссылки на другие файлы конфигурации NGINX. В
конфигурации по умолчанию файл `/etc/nginx/nginx.conf` включает блок `http` верхнего уровня
или контекст, который включает все файлы конфигурации в каталоге, описанном далее.

### /etc/nginx/conf.d/

Каталог `/etc/nginx/conf.d/` содержит дефолтный файл конфигурации HTTP-сервера. Файлы в этом каталоге,
оканчивающиеся на `.conf`, включаются в блок `http` верхнего уровня из файла `/etc/nginx/nginx.conf`.

Конфигурации в `/etc/nginx/conf.d/` лучше всего стоит организовывать таким образом, чтобы файлы конфигурации были краткими. В некоторых репозиториях пакетов эта папка называется `site-enabled`, а файлы конфигурации связаны с папкой с именем `site-available`; это соглашение устарело.

### /var/log/nginx/

Каталог `/var/log/nginx/` является расположением журнала по умолчанию для NGINX. В этом каталоге вы
найдете файл `access.log` и файл `error.log`.

`access.log` содержит запись для каждого запроса, который обслуживает NGINX.

Файл журнала ошибок `error.log` содержит события ошибок и информацию об отладке, если модуль
отладки включен.

### Команды NGINX

| Команда  | Описание                                                                                                         |
| -------- | ---------------------------------------------------------------------------------------------------------------- |
| nginx -h | Отображает меню справки NGINX.                                                                                   |
| nginx -v | Показывает версию NGINX.                                                                                         |
| nginx -V | Показывает информацию о NGINX.                                                                                   |
| nginx -t | Проверяет конфигурацию NGINX.                                                                                    |
| nginx -T | Проверяет конфигурацию NGINX и<br>выводит проверенную конфигурацию<br>на экран. Эта команда полезна при отладке. |

> 🕹 Попробуйте запустить эти команды на запущенном `nginx`
ответ:
[root@localhost dos]# nginx -h
nginx version: nginx/1.20.1
Usage: nginx [-?hvVtTq] [-s signal] [-p prefix]
             [-e filename] [-c filename] [-g directives]

Options:
  -?,-h         : this help
  -v            : show version and exit
  -V            : show version and configure options then exit
  -t            : test configuration and exit
  -T            : test configuration, dump it and exit
  -q            : suppress non-error messages during configuration testing
  -s signal     : send signal to a master process: stop, quit, reopen, reload
  -p prefix     : set prefix path (default: /usr/share/nginx/)
  -e filename   : set error log file (default: /var/log/nginx/error.log)
  -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
  -g directives : set global directives out of configuration file

[root@localhost dos]# nginx -v
nginx version: nginx/1.20.1

[root@localhost dos]# nginx -V
nginx version: nginx/1.20.1
built by gcc 11.4.1 20231218 (Red Hat 11.4.1-3) (GCC)
built with OpenSSL 3.0.7 1 Nov 2022
TLS SNI support enabled
configure arguments: --prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi --http-scgi-temp-path=/var/lib/nginx/tmp/scgi --pid-path=/run/nginx.pid --lock-path=/run/lock/subsys/nginx --user=nginx --group=nginx --with-compat --with-debug --with-file-aio --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_degradation_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_mp4_module --with-http_perl_module=dynamic --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-http_xslt_module=dynamic --with-mail=dynamic --with-mail_ssl_module --with-pcre --with-pcre-jit --with-stream=dynamic --with-stream_ssl_module --with-stream_ssl_preread_module --with-threads --with-cc-opt='-O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -march=x86-64-v2 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection' --with-ld-opt='-Wl,-z,relro -Wl,--as-needed -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -Wl,-E'


[root@localhost dos]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
[root@localhost dos]# nginx -T
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
# configuration file /etc/nginx/nginx.conf:
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/
