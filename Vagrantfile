Vagrant.configure("2") do |config|

  config.vm.define "cnode1" do |cnode1|
    cnode1.vm.box = "centos/7"
    cnode1.vm.network "private_network", ip: "192.168.44.100"
    cnode1.vm.hostname = "cnode1"
    cnode1.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
    end
    cnode1.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
  end
  
   config.vm.define "cnode2" do |cnode2|
    cnode2.vm.box = "centos/7"
    cnode2.vm.network "private_network", ip: "192.168.44.101"
    cnode2.vm.hostname = "cnode2"
    cnode2.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
    end
    cnode2.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
  end 
  
   config.vm.define "cnode3" do |cnode3|
    cnode3.vm.box = "centos/7"
    cnode3.vm.network "private_network", ip: "192.168.44.102"
    cnode3.vm.hostname = "cnode3"
    cnode3.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
    end
    cnode3.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
  end 
  
  config.vm.define "cnode4" do |cnode4|
    cnode4.vm.box = "centos/7"
    cnode4.vm.network "private_network", ip: "192.168.44.103"
    cnode4.vm.hostname = "cnode4"
    cnode4.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
    end
    cnode4.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
  end
  
  config.vm.define "cnode5" do |cnode5|
    cnode5.vm.box = "centos/7"
    cnode5.vm.network "private_network", ip: "192.168.44.104"
    cnode5.vm.hostname = "cnode5"
    cnode5.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
    end
    cnode5.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
  end 
  
end