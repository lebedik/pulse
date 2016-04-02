include_recipe 'apache2'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'

include_recipe 'apache2::mod_proxy_balancer'
include_recipe 'apache2::mod_headers'

template '/etc/httpd/sites-enabled/pulse.conf' do
  source 'pulse.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
#  notifies :restart, "service[#{node['apache']['service_name']}]", :delayed
end

execute 'restart apache' do
  command '/etc/init.d/httpd restart'
  action :run
end
