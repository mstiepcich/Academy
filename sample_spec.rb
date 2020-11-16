require 'spec_helper'

describe docker_container('httpd') do
  it { should exist }
end

describe docker_container('httpd') do
  it { should be_running }
end

describe docker_container('httpd') do
  it { should have_volume('/usr/local/apache2/htdocs','/home/vagrant/htdocs') }
end

describe port(80) do
  it { should be_listening }
end

describe package('ansible') do
  it { should be_installed }
end

describe package('rake') do
  it { should be_installed }
end

