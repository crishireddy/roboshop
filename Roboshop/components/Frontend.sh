#!/bin/bash
set -e

yum install nginx -y
systemctl enable nginx
systemctl start nginx
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
stat $?
echo "moved frontend files"
mv static/* .
echo "moved static files"
stat $?

mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx

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