#!/bin/sh

echo -en "Enter your Taikun email:\n> "
read taikun_email
echo -en "Enter your Taikun password:\n> "
read taikun_password

for task in $(find -type d -name "task_*"); do
  sed -i "s/<TAIKUN_EMAIL>/$taikun_email/" "$task/taikun_credentials.tfvars"
  sed -i "s/<TAIKUN_PASSWORD>/$taikun_password/" "$task/taikun_credentials.tfvars"
done
