#!/bin/bash

mkdir /home/vagrant/serverspec

sleep 1

cd /home/vagrant/serverspec

sleep 1 

printf "1\2" | serverspec-init
