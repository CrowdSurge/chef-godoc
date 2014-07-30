require_relative '../spec_helper'

describe 'godoc::default' do
      
  before do
  	stub_command("/usr/local/go/bin/go version | grep \"go1.2.2 \"").and_return("go1.2.2 ")
  end

  context 'check that the default godoc user would be created' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'creates a user named "godoc"' do
      expect(chef_run).to create_user('godoc').with(
        home: '/opt/go/godoc',
        shell: '/bin/bash',
        comment: 'Godoc User',
        supports: { :manage_home => true }
      )
    end
  end

  context 'check that a custom godoc user was created' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['godoc']['user'] = 'custom'
        node.set['godoc']['home'] = '/custom'
      end.converge(described_recipe)
    end

    it 'creates the godoc user "custom" with a homedir of "/custom"' do
      expect(chef_run).to create_user('custom').with(
        home: '/custom',
        shell: '/bin/bash',
        comment: 'Godoc User',
        supports: { :manage_home => true }
      )
    end
  end

end
