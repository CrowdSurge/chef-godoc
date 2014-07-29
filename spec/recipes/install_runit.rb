require_relative '../spec_helper'

describe 'godoc::default' do
  context 'check that the recipe is in the run list' do	
	  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
      
      before do
      	stub_command("/usr/local/go/bin/go version | grep \"go1.2.2 \"").and_return("go1.2.2 ")
      end
      
	  it 'includes the `runit` recipe' do
	    expect(chef_run).to include_recipe('runit::default')
	  end
  end
end
