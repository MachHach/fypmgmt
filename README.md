# FYP Management System

One-stop platform to manage your Final Year Projects.

## Getting started

### Development

Requirements:

* [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [HashiCorp Vagrant](https://www.vagrantup.com/downloads.html)

To start the VM:

1. Copy `.env.dev.example` as `.env`.
2. Run the following commands (as Administrator):

```bash
vagrant up
vagrant ssh
cd /var/www/html/fypmgmt
# Install project dependencies
composer install
npm install
# Compile assets
npm run dev
# Generate security tokens
php artisan key:generate
# Initialize database
php artisan migrate
php artisan db:seed
```

To view list of users in database via SQL command:

```bash
sudo -u {username} psql -d {database} -c "SELECT name,email FROM users;"
```

To stop the VM, run either of these commands:

* `vagrant suspend` to sleep.
* `vagrant halt` to shutdown.
* `vagrant destroy` to remove.

## License

[MIT](https://opensource.org/licenses/MIT)
