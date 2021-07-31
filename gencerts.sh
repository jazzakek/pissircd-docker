mkdir certs
openssl req -new -x509 -days 365 -nodes -out ./certs/server.cert.pem -keyout ./certs/server.key.pem -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"