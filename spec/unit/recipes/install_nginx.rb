require 'chefspec'
require_relative '../spec_helper'

describe 'godoc::nginx-proxy' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the `nginx` recipe' do
    expect(chef_run).to include_recipe('nginx::default')
    expect(chef_run).to include_package('nginx')
    expect(chef_run).to include_service('nginx')
  end
end