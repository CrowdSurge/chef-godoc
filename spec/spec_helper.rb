require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'


RSpec.configure do |config|
  config.formatter = :documentation
  config.platform = 'ubuntu'
  config.version = '12.04'
end
