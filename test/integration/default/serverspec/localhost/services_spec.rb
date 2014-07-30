require_relative '../spec_helper'
require 'json'

describe port(9200) do
  it { should be_listening }
end

describe user('godoc') do
  it { should exist }
  it { should have_home_directory '/opt/go/godoc' }
  it { should have_login_shell '/bin/bash' }
end
