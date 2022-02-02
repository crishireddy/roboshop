#!/bin/bash
#COMPONENT=Frontend

#we have to import from common .sh the output commands so
#we have to give a source place for system to import so we do

source components/common.sh

Print "Installing Nginx" " Yum install nginx -y "
yum install nginx -y
Stat $?
#stat $? stat function we will make in common and $? is a exit status of our yum command
#
Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl start nginx
Stat $?

Print "Downloading Frontend content" 'curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"'
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
Stat $?

cd/usr/share/nginx/html
rm -rf/*
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

#this is the main script, the only Problem with this script is if any one command fails insted of stopping it
#will jump into nexet command to avoid that use set -e at the first.

#yum install nginx -y
#systemctl enable nginx
#systemctl start nginx

#curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

#cd /usr/share/nginx/html
#rm -rf *
#unzip /tmp/frontend.zip
#mv frontend-main/* .
#mv static/* .
#rm -rf frontend-master README.md
#mv localhost.conf /etc/nginx/default.d/roboshop.conf

#systemctl restart nginx