#
# Cookbook:: custom_tomcat
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'java' 

group node['tomcat']['group']

user node['tomcat']['user']
group node['tomcat']['group']
system true
shell node['tomcat']['terminal']
end

ark 'tomcat' do
url node['tomcat']['url']
home_dir node['tomcat']['homedir']
owner node['tomcat']['user']
group node['tomcat']['group']
end

template '/etc/init.d/tomcat' do
source 'tomcat-init.erb'
mode '0755'
owner node['tomcat']['root']
group node['tomcat']['root']
end

execute 'chmod' do
command 'chmod 755 /opt/tomcat/bin/*.sh'
action :run
end

execute 'chkconfig' do
command 'chkconfig tomcat on' 
command 'service tomcat start'
action :run
end
