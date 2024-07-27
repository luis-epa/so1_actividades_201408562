#!/bin/bash

# Verificar si el username se pasa como argumento
if [[ $# -gt 0 ]]; then
	GITHUB_USER=$1
# Si no se ha definido como variable de entorno asignarle un valor por defecto
elif [[ -z "$GITHUB_USER" ]]; then
	GITHUB_USER="torvalds"
fi

# Llamada a la API de GitHub

response=$(curl -s "https://api.github.com/users/${GITHUB_USER}")

# Obtener los campos de la respuesta

user_id=$(echo "$response" | jq -r '.id')
created_at=$(echo "$response" | jq -r '.created_at')

# Crear el directorio para almacenar el log

current_date=$(date +"%Y-%m-%d")

mkdir -p "/tmp/$current_date"

# Escribir el texto al archivo /tmp/saludos.log

echo "Hola, $GITHUB_USER. User ID: $user_id. Cuenta creada el: $created_at" >>  "/tmp/$current_date/saludos.log"
