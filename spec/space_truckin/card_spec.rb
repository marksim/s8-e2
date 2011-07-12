require 'spec_helper'

describe SpaceTruckin::Card do
  it "has a resource type" do
    SpaceTruckin::Card.new(:food).to_s.should == "Food"
  end

  it "must be initialize with one of the 4 predefined types" do
    lambda { SpaceTruckin::Card.new(:random) }.should raise_error
  end
end