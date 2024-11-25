#!/bin/bash

# Запускаем контейнер с образом atlekbai/local-vps
docker run -d --name local-vps-22 \
  -p 2222:22 -p 80:80 \
  atlekbai/local-vps

# Создаем SSH-ключ, если он еще не существует
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Копируем SSH-ключ в контейнер
docker exec -i local-vps-22 sh -c "mkdir -p /root/.ssh && chmod 700 /root/.ssh"
docker cp ~/.ssh/id_rsa.pub local-vps-22:/root/.ssh/authorized_keys
docker exec -i local-vps-22 sh -c "chmod 600 /root/.ssh/authorized_keys"

echo "Контейнер запущен, и SSH-ключ установлен."
