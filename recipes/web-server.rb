include_recipe 'apache2'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'

include_recipe 'apache2::mod_proxy_balancer'
include_recipe 'apache2::mod_headers'
# app_servers = node['epc-provisioning']['instances'].find_all { |i| i[1]['role'] == 'pulse' }.map { |i| i[1]['private_ip_address'] }
app_servers = node['epc-provisioning']['instances'].find_all { |i| i[1]['role'] == 'app-bundle' }.map { |i| i[1]['private_ip_address'] }
app_servers = ['localhost'] if app_servers.empty?
template '/etc/httpd/sites-enabled/pulse.conf' do
  source 'pulse.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  # notifies :restart, "service[#{node['apache']['service_name']}]", :delayed
  variables(
    :proxy_to => app_servers
  )
end

execute 'restart apache' do
  command '/etc/init.d/httpd restart'
  action :run
end
