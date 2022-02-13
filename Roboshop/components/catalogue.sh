#!/bin/bash

source components/common.sh

Print "yum install Nodejs" "yum install nodejs make gcc-c++ -y "
yum install nodejs make gcc-c++ -y
stat $?

Print "adding roboshop user" "useradd roboshop"
id roboshop
stat $?

print "downloading catalogue component" "curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip""
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
stat $?

print "extracting roboshop components" "cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && cd /home/roboshop/catalogue"
rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && cd /home/roboshop/catalogue
stat $?

exit

npm install

mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl start catalogue
systemctl enable catalogue