#!/bin/bash


component=$1
environment=$2

dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/ManjuTamanampudi/ansible-roboshop-roles-tf.git
cd ansible-roboshop-roles-tf
git pull
# if [ ! -d "ansible-roboshop-roles-tf" ]; then
#   git clone https://github.com/ManjuTamanampudi/ansible-roboshop-roles-tf.git
# else
#   cd ansible-roboshop-roles-tf && git pull
# fi


ansible-playbook -e component=$component -e env=$environment roboshop.yaml