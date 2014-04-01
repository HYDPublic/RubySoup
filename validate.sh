#!/bin/bash
# ---
# Usage: that file should be run on the master machine in order to 
# verify and install the public/private key authentication from
# the master to the slave
# ---

# set -x

echo "******************"
echo "* Server1 status *"
echo "******************"
ip addr show
ruby -v
ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'
#  # rvm list known 
#  # rvm help mount
#  # rvm list remote

echo "***************"
echo "* authentication key generation for 10.11.1.101 *"
echo "***************"
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
ssh-copy-id vagrant@10.11.1.101

echo "*******************************"
echo "* SSH from server1 to server2 *"
echo "*******************************"
ssh vagrant@10.11.1.101 <<"EOF"
ip addr show
ruby -v
EOF

echo "**********************"
echo "* Running Unit Tests *"
echo "**********************"
cd /vagrant/ruby
ruby test_String.rb
ruby test_SSHExec.rb
ruby test_SCP.rb
