cookbook_file "/home/vagrant/.bashrc" do
  source "bashrc"
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/.gemrc" do
  source "gemrc"
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/.gitconfig" do
  source "gitconfig"
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/.gitignore" do
  source "gitignore"
  owner "vagrant"
  group "vagrant"
end

cookbook_file "/home/vagrant/.vimrc" do
  source "vimrc"
  owner "vagrant"
  group "vagrant"
end

execute "clean-up-bento-scripts" do
  command "rm /home/vagrant/*.sh"
  not_if { Dir["/home/vagrant/*.sh"].empty? }
end

include_recipe "nginx::source"

cookbook_file "/etc/nginx/sites-available/querycasts-lab" do
  source "nginx_vhost"
end

nginx_site "querycasts-lab"
