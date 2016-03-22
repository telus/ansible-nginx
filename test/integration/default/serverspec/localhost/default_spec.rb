require 'spec_helper'

describe 'ansible-nginx::install' do

  describe package('nginx-naxsi') do
    it { should be_installed.by('apt') }
  end

  describe package('ngxtop') do
    it { should be_installed.by('pip') }
  end

end

describe 'ansible-nginx::configure' do

  # should not need bool() on vars
  # testing that this doesn't get created by default
  describe file('/data/www/auth') do
    it { should_not be_a_file }
  end

  describe file('/var/run/nginx') do
    it { should be_directory }
    it { should be_owned_by 'www-data' }
    it { should be_grouped_into 'www-data' }
  end

  describe file('/etc/init.d/nginx') do
    its(:content) { should match /\/var\/run\/nginx\/nginx.pid/ }
  end

  describe file('/etc/logrotate.d/nginx') do
    its(:content) { should match /\/var\/run\/nginx\/nginx.pid/ }
  end

  describe file('/etc/default/nginx') do
    its(:content) { should match /ULIMIT='-n 4096'/ }
  end

  describe file('/etc/nginx/nginx.conf') do
    its(:content) { should match /user www-data;/ }
    its(:content) { should match /pid \/var\/run\/nginx\/nginx.pid;/ }
    its(:content) { should match /worker_connections 4096;/ }
    its(:content) { should match /server_tokens off;/ }
    its(:content) { should match /header field./ }
    its(:content) { should match /gzip on;/ }
  end

  describe file('/etc/nginx/sites-available/site.conf') do
    its(:content) { should_not match /auth_basic/ }
    its(:content) { should match /server_name localhost;/ }
    its(:content) { should match /root \/data\/www\/docroot;/ }
    its(:content) { should match /index index.html;/ }
    its(:content) { should match /client_max_body_size 1m;/ }
  end

end

describe 'ansible-nginx::logging' do

  describe file('/var/log/nginx') do
    it { should be_directory }
    it { should be_owned_by 'www-data' }
    it { should be_grouped_into 'www-data' }
  end

end

describe 'ansible-nginx::default' do

  describe port(80) do
    it { should be_listening }
  end

  describe service('nginx') do
    it { should be_enabled   }
    it { should be_running   }
  end

end
