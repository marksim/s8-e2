require 'spec_helper'

describe SpaceTruckin::Player do
  it "initializes with a name" do
    SpaceTruckin::Player.new("Mark").name.should == "Mark"
  end
end