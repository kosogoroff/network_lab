#!/usr/bin/env bash

INVENTORY="inventory.ini"
> "$INVENTORY"

echo "[vagrant_boxes]" > "$INVENTORY"
echo "" >> "$INVENTORY"

# Объявляем ассоциативные массивы для хранения данных
declare -A HOSTS_PORT
declare -A HOSTS_NAME
declare -A HOSTS_KEY

current_host=""

# Читаем вывод vagrant ssh-config
while IFS= read -r line; do
#    echo "line= $line"

    # Если встретили Host, запоминаем имя текущего хоста
    if [[ "$line" =~ ^Host[[:space:]]+([^[:space:]]+) ]]; then
        current_host="${BASH_REMATCH[1]}"
#        echo ">>> Обнаружен хост: $current_host"
    fi

    # Если есть текущий хост, пытаемся собрать для него данные
    if [[ -n "$current_host" ]]; then
        # Собираем Port
        if [[ "$line" =~ ^[[:space:]]*Port[[:space:]]+([0-9]+) ]]; then
            HOSTS_PORT["$current_host"]="${BASH_REMATCH[1]}"
#            echo "Port= ${HOSTS_PORT[$current_host]}"
        fi

        # Собираем IdentityFile
        if [[ "$line" =~ ^[[:space:]]*IdentityFile[[:space:]]+\"?([^\"]+)\"? ]]; then
            HOSTS_KEY["$current_host"]="${BASH_REMATCH[1]}"
#            echo "Key= ${HOSTS_KEY[$current_host]}"
        fi

	        # Собираем HostName
        if [[ "$line" =~ ^[[:space:]]*HostName[[:space:]]+\"?([^\"]+)\"? ]]; then
            HOSTS_NAME["$current_host"]="${BASH_REMATCH[1]}"
#            echo "Key= ${HOSTS_NAME[$current_host]}"
        fi
    fi
done < <(vagrant ssh-config)

# ТЕПЕРЬ ВЫВОДИМ ВСЁ СРАЗУ
# Проходим по всем найденным хостам
for host in "${!HOSTS_PORT[@]}"; do
    port="${HOSTS_PORT[$host]}"
    key="${HOSTS_KEY[$host]}"
    name="${HOSTS_NAME[$host]}"
    
    # Проверка: есть ли и порт, и ключ
    if [[ -n "$port" && -n "$key" ]]; then
        clean_key="${key//\"/}"
        echo "$host ansible_host=$name ansible_port=$port ansible_private_key_file=$clean_key" >> "$INVENTORY"
        echo ">>> ЗАПИСАНО: $host (port=$port)"
    else
        echo "⚠️ Пропущен $host: нет полных данных (port='$port', key='$key', name='$name')"
    fi
done

# Добавляем переменные группы
echo "" >> "$INVENTORY"
echo "[vagrant_boxes:vars]" >> "$INVENTORY"
echo "ansible_user=vagrant" >> "$INVENTORY"
echo "ansible_python_interpreter=/usr/bin/python3" >> "$INVENTORY"
echo "host_key_checking=False" >> "$INVENTORY"

echo "✅ Готово! Содержимое inventory.ini:"
cat "$INVENTORY"
