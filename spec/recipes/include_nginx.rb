require_relative '../spec_helper'

describe 'godoc::default' do

  before do
  	stub_command("/usr/local/go/bin/go version | grep \"go1.2.2 \"").and_return("go1.2.2 ")
  end

  context 'nginx-proxy is set to true, include recipe["godoc::nginx"]' do
    let(:chef_run) do 
      ChefSpec::Runner.new do |node|
        node.set["godoc"]["nginx"]["proxy"] = true
      end.converge(described_recipe)
    end

    it 'includes the nginx recipe' do
      expect(chef_run).to include_recipe('godoc::nginx-proxy')
    end
  end
end
