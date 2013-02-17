date > /etc/vagrant_box_build_time

apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install vim

# Install the VirtualBox guest additions
apt-get -y install dkms
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso
rm /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso

# Set up sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers

# Add puppet user and group
adduser --system --group --home /var/lib/puppet puppet

# Install NFS client
apt-get -y install nfs-common

# Install Ruby, update RubyGems and gems, install Chef and Puppet
RUBY_VERSION=1.9.3-p385
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-$RUBY_VERSION.tar.gz
tar xvzf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION
./configure --prefix=/opt/ruby
make
make install
/opt/ruby/bin/gem update --system
/opt/ruby/bin/gem update
/opt/ruby/bin/gem cleanup
/opt/ruby/bin/gem install chef puppet --no-rdoc --no-ri
cd ..
rm -rf ruby-$RUBY_VERSION

# Add /opt/ruby/bin to the global path as the last resort so
# Ruby, RubyGems, and Chef/Puppet are visible
echo 'PATH=$PATH:/opt/ruby/bin/' > /etc/profile.d/vagrantruby.sh

# Install Vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Remove items used for building, since they aren't needed anymore
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y clean

# Remove left over leases and persistent rules
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
# http://6.ptmc.org/?p=164
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "pre-up sleep 2" >> /etc/network/interfaces

# Zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY