require_relative '../spec_helper'

describe 'godoc::default' do
  before do
    stub_command("/usr/local/go/bin/go version | grep \"go1.2.2 \"").and_return("go1.2.2 ")
  end

  context 'check that runit starts the godoc service' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'should include the runit recipe' do
      expect(chef_run).to include_recipe('runit')
    end

    it 'creates and starts the godoc runit service' do
      expect(chef_run).to enable_runit_service('godoc').with(
        options: { :user => 'godoc' }
      )
    end
  end

  context 'if a godoc user is set to "custom", runs godoc with as the user "custom"' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['godoc']['user'] = 'custom'
      end.converge(described_recipe)

      it 'creates and starts the godoc runit service' do
        expect(chef_run).to enable_runit_service('godoc').with(
          options: { :user => 'godoc' }
        )
      end
    end
  end
end
