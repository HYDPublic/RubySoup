require 'pry'
require './Machine'
require './Role'

# # A vm from the lab
# p212 = Machine.new("pta", "perfvm212")

# A vagrant vm vagrant@10.11.1.101
t101 = Machine.new("vagrant", "10.11.1.101")

the_list_of_commands = ['date', 'ls -a .bashrc', 'sleep 3', 'sleep 2', 'sleep 1', ]

puts t101.ssh(the_list_of_commands)

# todo - we can use pry as a debugger
#binding.pry
