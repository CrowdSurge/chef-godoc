require 'chefspec'
require_relative '../spec_helper'

describe 'godoc::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the `runit` recipe' do
    expect(chef_run).to include_recipe('runit::default')
  end
end