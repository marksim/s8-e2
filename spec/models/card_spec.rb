require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Card do
  it "has a resource type" do
    Card.new(:food).to_s.should == "Food"
  end

  it "must be initialize with one of the 4 predefined types" do
    lambda { Card.new(:random) }.should raise_error
  end
end