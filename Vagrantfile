VAGRANTFILE_API_VERSION = "2"

this_role = 'devbox'
this_env = 'dev'

ENV['ANSIBLE_CONFIG'] = "vagrant/ansible.cfg"
ENV['ANSIBLE_DIR'] = "#{ENV['HIPOPS']}/ansible/"

vagrant_ip = "192.168.52.111"

boxes = {
 "centos7" => "geerlingguy/centos7",
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  boxes.each do |distribution, box|
    config.ssh.insert_key = false
  
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    end
  
    config.vm.define "#{distribution}-#{this_role}" do |host|
      host.vm.hostname = "#{this_role}"
      host.vm.box = box
      host.vm.network :private_network, ip: vagrant_ip

      # deploy this role
      host.vm.provision "ansible" do |ansible|
        ansible.extra_vars = {
          ENV: this_env,
          is_vagrant: true
        }
        ansible.playbook = "#{ENV['ANSIBLE_DIR']}/#{this_role}.yml"
        ansible.groups = {
          "#{this_role}-#{this_env}" => [ "#{distribution}-#{this_role}" ]
        }
      end

    end
  end
end
