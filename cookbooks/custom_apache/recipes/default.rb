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

service 'httpd' do
action [:enable, :start]
end
