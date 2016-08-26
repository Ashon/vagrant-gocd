# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # configure vm stacks
  vagrant_box_name = "ubuntu-14_04"
  vagrant_box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  vm_cpus = 2
  vm_memory = 4096

  gocd_subnet = "192.168.22."
  gocd_server_ip_end = 10

  gocd_agent_count = 2
  gocd_agent_ip_start = 11

  # setup GoCD server
  config.vm.define "gocd_server" do |gocd_server|

    gocd_server.vm.provider "virtualbox" do |v|
      v.cpus = vm_cpus
      v.memory = vm_memory
    end

    gocd_server.vm.box = vagrant_box_name
    gocd_server.vm.box_url = vagrant_box_url

    gocd_server.vm.network "private_network", ip: "#{gocd_subnet}#{gocd_server_ip_end}"
    gocd_server.vm.synced_folder ".", "/vagrant", disabled: true

  end

  # setup GoCD agents
  (1..gocd_agent_count).each do |i|
    config.vm.define "gocd_agent-ubuntu-#{i}" do |gocd_agent|

      gocd_agent.vm.provider "virtualbox" do |v|
        v.cpus = vm_cpus
        v.memory = vm_memory
      end

      gocd_agent.vm.box = vagrant_box_name
      gocd_agent.vm.box_url = vagrant_box_url

      gocd_agent.vm.network "private_network", ip: "#{gocd_subnet}#{gocd_agent_ip_start+ i - 1}"
      gocd_agent.vm.synced_folder ".", "/vagrant", disabled: true

    end
  end

end
