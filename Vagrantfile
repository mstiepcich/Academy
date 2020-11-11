Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.ssh.keys_only = false
  #config.ssh.private_key_path = "C:/Users/mariano.stiepcich/.ssh/id_rsa"
#               config.vm.provision "shell",
#                       inline: "cat /vagrant/inventory > /etc/ansible/hosts"


  config.vm.provision "ansible_local" do |ansible|

	ansible.playbook = "playbook.yml"
    	ansible.limit = "all"
	ansible.inventory_path = "/vagrant/inventory"
   	 
  		config.vm.provision "docker" do |d|
    			d.pull_images "httpd"
			d.run "httpd",
			args: "-d -p 80:80"
    	end
  end
end
