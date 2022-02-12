#!/bin/bash

source components/common.sh

Print "Installing nodejs" " install nodejs make gcc-c++ -Y "
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding Roboshop Project user" "useradd roboshop"
useradd roboshop
Stat $?

Print "Download Catalogue component code" " curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
Stat $?

Print ""Extract catalogue component code" "rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && cd /home/roboshop/catalogue"
rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip && mv catalogue-main catalogue && cd /home/roboshop/catalogue
Stat $?
exit

$ npm install

mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl start catalogue
systemctl enable catalogue