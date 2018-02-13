postgresrepo = File.basename(node['postgres']['download_url'])
postgresrpm = File.basename(postgresrepo, '.rpm')

remote_file "#{Chef::Config[:file_cache_path]}/#{postgresrepo}" do
  source node['postgres']['download_url']
  mode 0755
  action :create_if_missing
  not_if "rpm -qa | grep -qx '#{postgresrpm}'"
end

rpm_package 'postgres_repo' do
  source "#{Chef::Config[:file_cache_path]}/#{postgresrepo}"
  action :install
end

postgres_package = node['postgres']['package']
yum_package postgres_package do
  action :install
  not_if "rpm -qa | grep -qx '#{postgres_package}'"
end

package postgresrpm do
  action :remove
  only_if "rpm -qa | grep -qx '#{postgresrpm}'"
end

service 'postgresql-9.4' do
  action :enable
end

file '/tmp/postgresql-9.4' do
  action :create_if_missing
  notifies :run, 'execute[initdb]', :immediately
end

execute 'initdb' do
  command 'sudo service postgresql-9.4 initdb'
  action :nothing
end

service 'postgresql-9.4' do
  action :start
end
