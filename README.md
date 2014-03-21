
RubySoup
========

Vagrant virtual environment for learning and developing with Ruby, SSH, SCP and unit testing

It’s hard to be chunkier… Use at your own risk.

Introduction
------------

This project automates setting up a virtual development environment for Ruby, SSH (secure shell), SCP (secure copy) and public/private key authentication. 

Some of the current key features are:
* Setup two virtual machines with Vagrant: A master with ip address 10.11.1.100 and a slave with ip address 10.11.1.101.
* Use Puppet for provisioning. 
* RVM updates the Ruby version automatically to the latest version on the master machines.
* Allow password less SSH authentication from the master to the slave. 
* A set of unit test are provided in order to validate that the environment is setup correctly. 
* TDD in mind: Even if doing SSH doesn’t comply with the strict definition of TDD, the intent of this project is to provide an environment that enable to write tests first and to run those tests in a few seconds.

I started that project in order to experiment with code quickly and to deal with intermittent Internet connection, such as in the train or in remote part of Canada. I found out that this environment was more efficient than using remote servers for learning purpose. It helps me to learn and refine concepts quickly. 


Requirements
------------

In order to use that project you need to have the following tools installed on your host:
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant 1.4+](http://vagrantup.com)

Tips for beginners
------------------

If you are learning this stack of technology from scratch, or you don’t know where to start, I suggest starting with the [Vagrant documentation](http://docs.vagrantup.com/v2/). Walking through a couple of tutorial is beneficial. From there you can start learning about VirtualBox or Ruby. 

Building the environment
------------------------

Building the virtual machines and the environment is really simple:
  host$ git clone https://github.com/StephenBergeron/RubySoup.git
  host$ cd RubySoup
  host$ vagrant up
If the base box is not present that command fetches it first. The setup itself takes less than 5 minutes on my Dell Latitude E6420 with a WiFi connection. After the installation has finished, you can access the master virtual machine with

  host$ vagrant ssh server1
  
Post-Install and Validation 
---------------------------

Go to the default Vagrant shared folder (/vagrant) and execute the postInstall.sh script. That will enable the public and private key authentication from the master machine to the slave machine. Answer the questions and remember that the vagrant user uses the vagrant password. The final step will run a series of unit test. The Ruby code is located in /vagrant/ruby.

Suggested Usage
---------------

From the master, you use the slave as the remote machine for SSH execution. I recommend using that environment accordingly to the normal Vagrant workflow:
* Use your favorite editor with personal customization in the host computer.
* Test within the master virtual machine.

Going from here and TODOs 
-------------------------

Experiment with NFS synced folders and measure performances
http://docs.vagrantup.com/v2/synced-folders/nfs.html

License
-------

So far there is no license for this project, but use at your own risk.
