# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.host_name = "lab"

  config.vm.box = "opscode_ubuntu-12.04"

  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com" +
    "/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box"

  config.vm.network :hostonly, "33.33.33.10"

  config.ssh.forward_agent = true

  config.package.name = "querycasts-lab-0.0.1.pre1"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"

    chef.add_recipe("apt")
    chef.add_recipe("build-essential")
    chef.add_recipe("vim")
    chef.add_recipe("xml")
    chef.add_recipe("git")
    chef.add_recipe("ruby_build")
    chef.add_recipe("rbenv::system")
    chef.add_recipe("postgresql::server")
    chef.add_recipe("mongodb::10gen_repo")
    chef.add_recipe("memcached")
    chef.add_recipe("redisio::install")
    chef.add_recipe("redisio::enable")
    chef.add_recipe("nginx::source")
    chef.add_recipe("nodejs")
    chef.add_recipe("phantomjs")
    chef.add_recipe("lab")

    chef.json = {
      nodejs: {
        version: "0.8.20",
        checksum: "b780f58f0e3bc43d2380d4a935f2b45350783b37",
      },

      rbenv: {
        rubies: ["1.9.3-p385"],
        global: "1.9.3-p385",
        gems: {
          "1.9.3-p385" => [{
            name: "bundler"
          }]
        }
      },

      postgresql: {
        enable_pitti_ppa: true,
        password: {
          postgres: "querycasts"
        }
      }
    }
  end
end
