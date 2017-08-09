Vagrant.configure("2") do |config|
  HOSTS=5
  (1..HOSTS).each do |cluster_node|
    node_name = "cnode#{cluster_node}"
    config.vm.define node_name do |cnode|
        cnode.vm.box = "centos/7"
        cnode.vm.network "private_network", ip: "192.168.44.10#{cluster_node}"
        cnode.vm.hostname = node_name
        cnode.vm.provider :virtualbox do |vbox|
            vbox.name = node_name
            vbox.memory = 1024
            vbox.cpus = 1
        end
        cnode.vm.synced_folder '.', '/vagrant', disabled: true
        cnode.vm.provision :shell, path: "bash/bootstrap_avahi.sh", run: "always"
        # All vms have been provisioned. Run Ansible
        if cluster_node == HOSTS
            cnode.vm.provision :ansible do |ansible|
            ansible.limit = "all" # Connect to all machines
            ansible.playbook = "cassandra.yml"
            ansible.inventory_path = ".vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"
        end
    end
   end
  end
end
