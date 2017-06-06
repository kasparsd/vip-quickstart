This is a fork of the [VIP Quickstart development environment](http://vip.wordpress.com/documentation/quickstart/) with improved performance and reliability.

## Requirements

- [VirtualBox 5.x](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant 1.x](https://www.vagrantup.com/downloads.html)


## Getting Started

Clone this repository to your project folder:

	$ git clone https://github.com/kasparsd/vip-veryquickstart.git

Run the setup script which will provision the instance:

	$ ./vip-veryquickstart/bin/init --domain=yourproject.local

where `yourproject.local` is the domain name for the multisite install.

### WordPress Login

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
