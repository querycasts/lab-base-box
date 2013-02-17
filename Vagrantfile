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
    chef.add_recipe("lab")

    chef.json = {
      nginx: {
        default_site_enabled: false
      },

      rbenv: {
        rubies: ["1.9.3-p385"],
        global: "1.9.3-p385",
        gems: {
          "1.9.3-p385" => [{
            name: "bundler"
          }]
        }
      }
    }
  end
end
