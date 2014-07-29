require_relative '../spec_helper'

describe 'godoc::nginx-proxy' do
  context 'check that the recipe is in the run list' do	
	  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

	  it 'includes the `nginx` recipe' do
	    expect(chef_run).to include_recipe('nginx::default')
	    expect(chef_run).to install_package('nginx')
	    expect(chef_run).to start_service('nginx')
	  end
  end
end
