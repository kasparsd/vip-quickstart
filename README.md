This is a fork of the [VIP Quickstart development environment](http://vip.wordpress.com/documentation/quickstart/) with improved performance and reliability.

## Requirements

- [VirtualBox 5.x](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant 1.x](https://www.vagrantup.com/downloads.html)


## Getting Started

Clone this repository to your project folder:

	$ git clone --recursive https://github.com/kasparsd/vip-veryquickstart.git

Run the setup script which will provision the instance:

	$ cd vip-veryquickstart
	$ vagrant up --provision

Most of the time during Vagrant provisioning is spent fetching the [VIP shared plugins](https://vip-svn.wordpress.com/plugins/) and the [WordPress development tools](https://develop.svn.wordpress.org/trunk/).


### WordPress Login

Login at http://vip.local/wp-login.php:

- Username: `wordpress`
- Password: `wordpress`


## What You Get

- Ubuntu 14.04 LTS
- WordPress trunk
- WordPress.com VIP shared plugin repository
- WordPress multisite
- WordPress unit tests
- Custom WordPress.com modifications
- WP-CLI
- MySQL
- PHP 7.0
- Nginx
- PHPUnit


## Structure

- `bin` - Scripts.
- `puppet` - All Puppet manifests, modules, and templates.
- `www` - The web root, this is where all WordPress files live.
    - `config` - VIP specific configuration files.
    - `wp` - SVN checkout of [WordPress core](http://core.svn.wordpress.org/trunk/).
    - `wp-cli` - The latest stable version of WP-CLI.
    - `wp-content` - The regular `wp-content` directory for themes, plugins and uploads.
        - `themes/vip` - The VIP themes directory.
        - `themes/vip/plugins` - The VIP shared plugins directory.
    - `wp-tests` - SVN checkout of [WordPress development tools](http://develop.svn.wordpress.org/trunk/).
    - `local-config.php` - A local WordPress configuration file that is generated during provisioning and is not included in the version control.
    - `wp-cli.yml` - The WP-CLI config.
