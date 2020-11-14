Vagrant.configure("2") do |config|

  config.vm.define "production" do |production|
            production.vm.box = "hashicorp/bionic64"
            production.vm.network "private_network", ip: "192.168.75.17"
            production.vm.hostname = "production.academy"
            production.vm.network "forwarded_port", guest: 80, host: 8081

            production.vm.provision "shell",
              inline: "mkdir /home/vagrant/htdocs"

                production.vm.provision "docker" do |d|
                        d.pull_images "httpd"
                        d.run "httpd",
                        args: "-d -p 80:80 -v /home/vagrant/htdocs:/usr/local/apache2/htdocs"

                            production.vm.provision "shell",
                                inline: "cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
                            end
                end

  config.vm.define "staging" do |staging|
	  staging.vm.box = "hashicorp/bionic64"
  	  staging.vm.network "private_network", ip: "192.168.75.15"
	  staging.vm.hostname = "staging.academy"
	  staging.vm.network "forwarded_port", guest: 80, host: 8080

  		staging.vm.provision "docker" do |d|
              		d.pull_images "httpd"
              		d.run "httpd",
              		args: "-d -p 80:80 -v /home/vagrant/htdocs:/usr/local/apache2/htdocs"
  		
				staging.vm.provision "ansible_local" do |ansible|

					ansible.playbook = "playbook.yml"
		    			ansible.limit = "all"
					ansible.inventory_path = "/vagrant/inventory"
   	 
    	
					staging.vm.provision "shell",
                       				inline: "cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"

				    end
				end
		end
end

