#
# Cookbook:: custom_apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
package 'httpd' do
action :install
end

cookbook_file '/var/www/html/index.html' do
source 'index.html.raw'
mode 0644
end

ark 'template' do
url node['apache']['url']
prefix_root node['apache']['path']
owner node['apache']['user']
group node['apache']['group']

notifies :restart, 'service[httpd]', :delayed


service 'httpd' do
action [:enable, :start]
end

package 'unzip' do
action :install
end
