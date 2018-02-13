jrename = node['jre']['filename']

ruby_block 'get_secrets' do
  block do
    # iteration for every node in splunk.conf.comm_secrets, look at attributes.rb
    node['splunk']['conf']['comm_secrets'].each do |secret, subhash|
      Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
      command = "sudo #{ykeykey_getkey} #{subhash['getkey']}"
      command_out = shell_out(command)
      subhash['value'] = command_out.stdout
    end
  end
end

remote_file "#{Chef::Config[:file_cache_path]}/#{jrename}" do
  source node['jre']['download_url']
  mode 0755
  action :create_if_missing
  not_if "rpm -qa | grep -qx '#{jrename}'"
end

rpm_package 'jre' do
  source "#{Chef::Config[:file_cache_path]}/#{jrename}"
  only_if { ::File.exist?("#{Chef::Config[:file_cache_path]}/#{jrename}") }
  action :install
end
