# Gunakan image Nginx Alpine sebagai base image
FROM nginx:alpine

# Tentukan variabel environment yang diperlukan
ENV HTTP_PORT=80
ENV REVERSE_HOST=http://info.cern.ch/

# Set lokasi kerja ke /etc/nginx/conf.d
WORKDIR /etc/nginx/conf.d

# Copy file konfigurasi default.conf jika folder lokal kosong
COPY default.conf .

# Tambahkan entrypoint script untuk menangani pengecekan folder lokal
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port yang akan digunakan oleh Nginx
EXPOSE $HTTP_PORT

# Tentukan entrypoint untuk menjalankan script saat container dimulai
ENTRYPOINT ["/entrypoint.sh"]

# Perintah untuk menjalankan Nginx dalam mode daemon
CMD ["nginx", "-g", "daemon off;"]
