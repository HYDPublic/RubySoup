=begin
  * Description: Describe a role from a SSH centric point of view
  * Author: Stephen Bergeron
  * Date: 2014-03-03
=end
require './Phase'

class Role
  attr :name, :enable, :disable

  def initialize(n, e, d); @name = n; @enable = e; @disable = d; end

  def to_s
    "#@name"
  end

  IIS7 = Role.new(
  'iis7', 
  'sc start w3svc',
  'sc stop w3svc')
  OPENFIRE = Role.new(
  'openfire',
  'sc start Openfire_ns',
  'sc stop Openfire_ns')
  WFC = Role.new('wfc', 'sc start JBoss_WFC', 'sc stop JBoss_WFC')
  
  LOGMAN = Role.new('logman', 'logman.exe start perf_log < /dev/null > /dev/null 2>&1 &', 'logman stop perf_log')
  
  MSSQL2012 = Role.new('MSSQL 2012',nil,nil)
end