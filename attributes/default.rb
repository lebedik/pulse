default['mysql']['server_root_password'] = '11111'
default['mysql']['server_debian_password'] = '11111'
default['mysql']['server_repl_password'] = '11111'
default['pulse']['source_location'] = '/opt/pulse/source/'
default['pulse']['user'] = 'pulse'
default['pulse']['group'] = 'pulse'
default['pulse']['jmx_host'] = node['ipaddress']
default['pulse']['build_location'] = '/usr/share/tomcat6/webapps/'
default['pulse']['rmi_opts'] = " -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8090 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false  -Djava.net.preferIPv4Stack=true -Djava.rmi.server.hostname=#{node['pulse']['jmx_host']}"
default['pulse']['db_user'] = 'pulse'
default['pulse']['db_pass'] = 'pulse'
default['pulse']['db_name'] = 'pulse'
if node['epc-provisioning']['instances'].find { |i| i[1]['role'] == 'mysql' }
   default['pulse']['db_host'] = node['epc-provisioning']['instances'].find { |i| i[1]['role'] == 'mysql' }[1]['private_ip_address'
else
   'localhost'
 end
#default['pulse']['db_host'] = node['epc-provisioning']['instances'].find { |i| i[1]['role'] == 'mysql' }[1]['private_ip_address'] || 'localhost'
default['apache']['listen_ports'] = %w(80)
