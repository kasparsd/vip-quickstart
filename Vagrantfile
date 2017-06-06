require 'yaml'
require 'pp'

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

require File.expand_path('scripts/provision.rb')

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty32"
  config.vm.hostname = "veryquickstart"

  # Load custom site config
  settings = YAML::load_file('config-sample.yml')
  Veryquickstart.configure(config, settings)

  # Virtualbox overrides
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpus", "1"]
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
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
