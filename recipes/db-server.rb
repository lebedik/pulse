package 'mysql-server'

service 'mysqld' do
  action [:start, :start]
end
execute "set root password" do
  command "mysqladmin -u root password #{node['mysql']['server_root_password']}"
  action :run
  not_if {`mysql -uroot -p#{node['mysql']['server_root_password']} -e 'show databases'`.include?('mysql')}
end

template "/tmp/pulse.sql" do
  source "pulse.sql.erb"
end

execute "creating db '#{node['pulse']['db_name']}'" do
  command "mysql -uroot -p#{node['mysql']['server_root_password']} -e 'Create database pulse;';"
  action :run
  not_if {`mysql -uroot -p#{node['mysql']['server_root_password']} -e 'show databases'`.include?(node['pulse']['db_name'])}
end

execute "creating user '#{node['pulse']['db_user']}'" do
  command "mysql -uroot -p#{node['mysql']['server_root_password']} \
              -e \"
                   CREATE USER '#{node['pulse']['db_user']}'@'localhost' identified by '#{node['pulse']['db_pass']}';\
                   GRANT ALL PRIVILEGES ON #{node['pulse']['db_name']}.* TO '#{node['pulse']['db_user']}'@'localhost';\
                   CREATE USER '#{node['pulse']['db_user']}'@'%' identified by '#{node['pulse']['db_pass']}';\
                   GRANT ALL PRIVILEGES ON #{node['pulse']['db_name']}.* TO '#{node['pulse']['db_user']}'@'%';\";"
  action :run
  not_if {`mysql -uroot -p#{node['mysql']['server_root_password']} -e "show grants for '#{node['pulse']['db_user']}'@'%'"`.include?('ALL')}
end


execute "setup db" do
  command "mysql -uroot -p#{node['mysql']['server_root_password']} #{node['pulse']['db_name']} < /tmp/pulse.sql;"
  action :run
  not_if {`mysql -uroot -p#{node['mysql']['server_root_password']} #{node['pulse']['db_name']} -e 'show tables'`.include?('shopsettings_taxgroup')}
end
