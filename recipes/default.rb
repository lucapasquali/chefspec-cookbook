#
# Cookbook Name:: pdi-base-cookbook
# Recipe:: default
#
# Copyright 2017 Yahoo Inc. All rights reserved.
#
# All rights reserved - Do Not Redistribute
#

ruby_block 'get_secrets' do
  block do
    # iteration for every node in splunk.conf.comm_secrets, look at attributes.rb
    node['splunk']['conf']['comm_secrets'].each do |secret|
      puts "getkey: #{secret['getkey']}"
      command_out = shell_out(command)
      secret['value'] = 'culo'
      puts "secret value: #{secret['value']}"
    end
  end
end
