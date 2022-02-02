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
  exit 1
fi

#if user id not equal to 0 then echo. as user id for root is always 0
#if we dont give exit status it wont stop at you must be root, and give content
#from cart or cata or front etc. to stop at at root user message you
#have to tell system to exit if t finds error (not user)


# I just want to go with a function which is


#Print() {
 # echo -e "\e[1m $(date +%c) \e[35m$(hostname)\e[0m \e[1;36m${COMPONENT}\e[0m :: $1"
#}

#in the above 1st print function we are calling for component variable so
#we give in frontend and finally the first argument passed to print st::
#so above is common for all script to display result when we pull
# and print function is called in .sh folders (cart,cata,front,mongodb etc..)

Print() {
  echo -e "[\e[1;34mInfo\e[0m] ------------< $1 >-------------------------"
  echo -e "[\e[1;34mInfo\e[0m]\e[1; $2 \e[0m"
  echo -e "[\e[1;
    34mInfo\e[0m
    ]------------------------------------------------"
}


Stat () {
   echo -e "[\e[1;
    34mInfo\e[0m
    ]------------------------------------------------"
    if [ "$1" -eq 0 ]; then
      echo -e "[\e[1;34minfo\e[0m] \e[1;32mSUCCESS \e[0m"
    else
      echo -e "[\e[1;34minfo\e[0m] \e[1;31mFailure \e[0m"
    fi
 echo -e "[\e[1;
        34mInfo\e[0m
        ]------------------------------------------------"

}