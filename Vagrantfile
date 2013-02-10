# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.host_name = "classroom"

  config.vm.box = "opscode_ubuntu-12.04"

  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com" +
    "/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box"

  config.vm.network :hostonly, "33.33.33.10"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
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

    chef.json = {
      nodejs: {
        version: "0.8.19",
        checksum: "f4fdbb642055be65579e11cb52c823573efabcf2",
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
        password: {
          postgres: "querycasts"
        }
      }
    }
  end
end
