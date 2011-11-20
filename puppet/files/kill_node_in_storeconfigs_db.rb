#!/usr/bin/env ruby

## Usage: sudo ./kill_node_in_storeconfigs_db.rb 

require 'puppet/rails'

if ARGV.size != 1
  puts "  Usage: kill_node_in_storeconfigs_db.rb <hostname>\n"
  exit 1
end

Puppet[:config] = "/etc/puppet/puppet.conf"
Puppet.parse_config
pm_conf = Puppet.settings.instance_variable_get(:@values)[:master]

adapter = pm_conf[:dbadapter]
args = {:adapter => adapter, :log_level => pm_conf[:rails_loglevel]}

case adapter
  when "sqlite3":
    args[:dbfile] = pm_conf[:dblocation]
  when "mysql", "postgresql":
    args[:host]     = pm_conf[:dbserver] unless pm_conf[:dbserver].empty?
    args[:username] = pm_conf[:dbuser] unless pm_conf[:dbuser].empty?
    args[:password] = pm_conf[:dbpassword] unless pm_conf[:dbpassword].empty?
    args[:database] = pm_conf[:dbname]
  else
    raise ArgumentError, "Invalid db adapter %s" % adapter
end

ActiveRecord::Base.establish_connection(args)

if @host = Puppet::Rails::Host.find_by_name(ARGV[0].strip)
  print "Killing #{ARGV[0]}..." 
  $stdout.flush
  @host.destroy 
  puts "done."
else
  puts "Can't find host #{ARGV[0]}."
end

