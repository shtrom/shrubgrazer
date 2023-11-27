#!/bin/sh -e

if [ -e /etc/nginx/ssl/nginx-selfsigned.crt ]; then
	echo "${0}: /etc/nginx/ssl/nginx-selfsigned.crt already exists, skipping"
	exit 0
fi

mkdir -p ssl

echo "${0}: installing openssl ... "
apk update
apk add openssl

echo "${0}: creating certificate ... "
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=AU/ST=NSW/L=Sydney/O=Acme Inc. /OU=IT Department/CN=acme.com" \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt
