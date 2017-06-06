# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

#Vagrant.require_version ">= 1.5.0"
if `vagrant --version` < 'Vagrant 1.5.0'
  abort('Your Vagrant is too old. Please install at least 1.5.0')
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"
  config.vm.hostname = 'vip.local'
  config.vm.network "private_network", type: "dhcp"

  # Virtualbox overrides
  config.vm.provider "virtualbox" do |v|
    # Use 1GB of memory
    v.memory = 1024

    # Use 2 CPUs
    v.cpus = 2

    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
  end

  config.vm.synced_folder ".", "/srv", owner: 'www-data', group: 'www-data', mount_options: ["dmode=775", "fmode=775"]

  # Provision everything we need with Puppet
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "init.pp"
    puppet.options = ['--templatedir', '/srv/puppet/files']
    puppet.environment_variables = {
      "QUICKSTART_DOMAIN" => 'vip.local',
    }
  end

end
