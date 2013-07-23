Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.forward_port 80, 8080

  config.vm.customize ["modifyvm", :id, "--memory", 1024]

   config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.module_path = "puppet/modules"
     puppet.manifest_file  = "init.pp"
     puppet.options="--verbose --debug"
   end
end
