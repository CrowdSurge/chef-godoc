require_relative '../spec_helper'

describe 'godoc::nginx-proxy' do

  context 'check that nginx is installed and setup if nginx-proxy is true' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set["domain"] = 'local'
      end.converge(described_recipe)
    end
    it 'will install the godoc nginx template' do
      expect(chef_run).to render_file('/etc/nginx/sites-available/godoc').with_content(/server_name godoc\.local;/)
    end
    it 'will enable the godoc' do
      create_link('/etc/nginx/sites-enabled/godoc')
    end
  end

  context 'when the servername attribute is passed use it with nginx' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set["godoc"]["servername"] = 'godoc.custom'
      end.converge(described_recipe)
    end
    it 'will install the godoc nginx template' do
      expect(chef_run).to render_file('/etc/nginx/sites-available/godoc').with_content(/server_name godoc\.custom;/)
    end

    it 'will enable the godoc site' do
      create_link('/etc/nginx/sites-enabled/godoc')
    end

  end

end
