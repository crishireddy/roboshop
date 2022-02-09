#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of component Name"
  exit 1
fi

STATE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query "Reservations[*].Instances[*].State.Name" --output text)

if [ "$STATE" != "running" ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=lt-0aa25e272bc927222 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
  sleep 15
fi
# reason for the above command states tat when we already have a instance with a name running
#please fail to create another instance with same name, in the -z we ask to run a statemnet
#and give name to it like fronted or mongodb... etc in stat statement we are saying when
#status is not equal (!=) to running then create that instance with that name.
#ex we have instance frontend its stat is running
#cannot create another instance with same name, when we have above state code.

IPADDRESS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}"  --query "Reservations[*].Instances[*].PrivateIpAddress" --output text)
export component
export IPADDRESS

envsubst <record.json>/tmp/${component}.json

aws route53 change-resource-record-sets --hosted-zone-id Z04333592ORFI60SA0ANN --change-batch file:///tmp/${component}.json

#the above command is used to create a route id just like instance.

#in the above envsubt we are creating a .jason file in /tmp loacation







# If instance is already created we should not create any instance using ths.
#as it will create more instance with similar component name
#we are just giving the tag name but server is frontend so changing tag name wont work
# Here we can ask to do routs52 just like we create an instance