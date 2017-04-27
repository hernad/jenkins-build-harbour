Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-i386"

  config.persistent_storage.enabled = true
  config.persistent_storage.location = "./data.vmdk"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
  end

  config.vm.provision "shell", path: "build.sh"

end
