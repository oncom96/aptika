#!/bin/sh

# Cek apakah folder lokal kosong
if [ "$(ls -A /etc/nginx/conf.d)" ]; then
    echo "Folder sudah berisi konfigurasi, menggunakan konfigurasi yang ada."
else
    echo "Folder kosong, mengisi default.conf."
    cp /etc/nginx/conf.d/default.conf.bak /etc/nginx/conf.d/default.conf
fi

# Jalankan perintah CMD
exec "$@"
