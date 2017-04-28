#!/bin/bash
set -x
set -e

if [ -f /etc/redhat-release ]; then
  sudo yum -y update
  sudo yum -y groupinstall 'Development Tools'
  sudo yum -y install epel-release
  sudo yum -y install git-core ansible
fi

if [ -f /etc/lsb-release ]; then
  sudo apt-get update
  sudo apt-get install --assume-yes git-core ansible
fi

sudo ansible-playbook -vvvv install.yml

