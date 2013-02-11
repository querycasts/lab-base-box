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
