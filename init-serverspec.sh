#!/bin/bash

mkdir /home/vagrant/serverspec

sleep 1

cd /home/vagrant/serverspec

sleep 1 

printf "1\2" | serverspec-init

cp /vagrant/sample_spec.rb /home/vagrant/serverspec/spec/localhost/sample_spec.rb

cd /home/vagrant/serverspec

rake spec
