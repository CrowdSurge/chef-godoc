require_relative '../spec_helper'
require 'json'

describe port(80) do
  it { should be_listening }
end

describe service("nginx") do
  it { should be_running }
end
