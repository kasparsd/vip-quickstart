class Veryquickstart

  def Veryquickstart.configure(config, settings)
    script_dir = File.dirname(__FILE__)

    # Keep track of all hosts assigned to this box.
    site_hosts = []

    config.vm.network :private_network, ip: settings["ip"] ||= "192.168.74.74"

    if settings.include? 'sites'
      settings["sites"].each do |key, site|
        # Collect hosts for the hostupdater.
        site_hosts.push(*site["hosts"])
      end
    end

    if defined? VagrantPlugins::HostsUpdater
        config.hostsupdater.aliases = site_hosts
    end

  end

end
