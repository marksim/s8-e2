require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Player do
  it "initializes with a name" do
    Player.new("Mark").name.should == "Mark"
  end
end