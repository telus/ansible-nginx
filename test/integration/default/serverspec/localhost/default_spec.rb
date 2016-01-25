require 'spec_helper'

describe 'ansible-nginx::default' do

  describe port(80) do
    it { should be_listening }
  end

  describe service('nginx') do
    it { should be_enabled   }
    it { should be_running   }
  end

  describe file('/etc/nginx/sites-enabled/site') do
    it { should be_file }
  end
end
