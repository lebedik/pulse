# Installing needed packages
# application needs jdk1.6, tomcat6 and mysql-client package
package 'java-1.6.0-openjdk-devel'
package 'mysql'
package 'tomcat6'
service 'tomcat6' do
  action :stop
end



# ===================================================
# getting sources from git.epam.com
group node['pulse']['group'] do
  gid 1000
  action :create
end


user node['pulse']['user'] do
  action :create
  comment "Infoglue user"
  uid 1000
  gid "pulse"
end

directory "/opt/pulse/" do
  owner "pulse"
  group "pulse"
  mode "0755"

  action :create
end

# remote_file '/opt/pulse/pulse.zip' do
#   source 'https://sourceforge.net/projects/pulse-java/files/pulse/0.7/0.7-final/pulse-0.7-final.zip/download'
#   owner 'root'
#   group 'root'
# end

execute 'download sources' do
  command 'wget --no-check-certificate https://sourceforge.net/projects/pulse-java/files/pulse/0.7/0.7-final/pulse-0.7-final.zip/download -O /opt/pulse/pulse-final.zip'
  action :run
  not_if {File.exist?("/opt/pulse/pulse-final.zip")}
end

package 'unzip' do
  action :install
end

execute 'unzip pulse source' do
  cwd '/opt/pulse/'
  command 'unzip pulse-final.zip'
  action :run
  not_if {File.exist?("/opt/pulse/pulse")}
end

template '/opt/pulse/pulse/custom-webapp/WEB-INF/conf/log4j-config.xml' do
  source 'log4j-config.xml.erb'
  owner 'root'
  group 'root'
  mode 00744
end

template '/opt/pulse/pulse/custom-webapp/WEB-INF/conf/pulse.xml' do
  source 'pulse.xml.erb'
  owner 'root'
  group 'root'
  mode 00744
end

# package 'git'
# # Workaround to pull changes from epam repository
# cookbook_file  '/home/vagrant/.ssh/id_rsa' do
#   owner 'vagrant'
#   source 'gitlab.key'
#   mode 0600
# end

# directory '/root/.ssh/'
#
# file '/root/.ssh/config' do
#   content 'Host *.epam.com
#         StrictHostKeyChecking no
#         UserKnownHostsFile /dev/null
#         IdentityFile /home/vagrant/.ssh/id_rsa'
# end

# git node['pulse']['source_location'] do
#   repository "git@git.epam.com:aliaksei_korneev/pulse-source.git"
#   timeout 999999
#   action :sync
# #  ssh_wrapper "ssh -i /home/vagrant/.ssh/id_rsa"
# end

# directory node['pulse']['source_location'] do
#   owner node['pulse']['user']
#   group node['pulse']['user']
#   mode "0755"
#   recursive true
#   action :create
# end

# Building application if needed
package 'ant'
# template "#{node['pulse']['source_location']}/build.properties" do
#   source "build.properties.erb"
#   mode "0644"
# end


bash "building pulse application" do
  #  user "pulse"
  cwd '/opt/pulse/pulse'
  code <<-EOH
    bash build.sh
  EOH
  not_if {File.exist?("/opt/pulse/pulse/build/pulse.war")}
end

bash "copy war file" do
  #  user "pulse"
  cwd '/opt/pulse/pulse'
  code <<-EOH
    cp -rf /opt/pulse/pulse/build/pulse.war /usr/share/tomcat6/webapps/
  EOH

end

# bash "set permissions webapps for tomcat" do
#   cwd node['pulse']['build_location']
#   code <<-EOH
#     chown -R tomcat:tomcat #{node['pulse']['build_location']}""
#   EOH
# #  not_if {File.exist?("#{node['tomcat']['home']}/webapps/pulseCMS")}
# #  notifies :restart, "service[#{node['tomcat']['base_instance']}]", :immediately
# end
service "tomcat6" do
  action :restart
end
