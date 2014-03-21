=begin
  * Description: Model a machine from a SSH centric point of view
  * Author: Stephen Bergeron
  * Date: 2014-02-28
=end
require 'net/ssh'
require 'pry'

SSHStatus = Struct.new :machine, :execution do

  def overview
    "SSHStatus for #{machine}!"
  end
end

ExecStatus = Struct.new :time, :duration, :command, :result do; end

class Machine

  attr :user, :host, :roles

  def initialize(u, h, *rs); @user, @host, @roles = u, h, rs; end

  def ssh commands
    SSHStatus.new(self.to_s, Net::SSH.start( @host, @user) do |session|
      commands.map{|c|
        t1 = Time.new
        res = session.exec!(c)
        t2 = Time.new
        ExecStatus.new(t1.strftime("%Y%m%d-%Hh%Mm%S"), t2-t1, c , res)
      }
    end
    )

  end

  def to_s; "#@host"; end

end