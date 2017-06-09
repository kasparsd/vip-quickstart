class Veryquickstart

  def Veryquickstart.configure(config, settings)
    script_dir = File.dirname(__FILE__)

    config.vm.hostname = settings["hostname"] ||= "veryquickstart.local"
    config.vm.network :private_network, ip: settings["ip"] ||= "192.168.74.74"

    if defined? VagrantPlugins::HostsUpdater
      config.hostsupdater.aliases = settings["sites"].keys
    end

  end

end
