#!/bin/bash

#if we write echi I am common here and push and pull and give
# now if we give  make cart or cata
#then u will get I am common and then welcome to cart or catalogue
#so common is a dependency

#now main the first thing we have to see is its getting executed by root
#or not so we give command

## validate the script is executed as root user or not
USER_ID=$(id -u)

if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31mYou must be a root user to execute this script\e[0m"
fi

#if user id not equal to 0 then echo. as user id for root is always 0
