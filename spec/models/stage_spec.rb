require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Stage do
  it "has 5 subclasses" do
    Stage.subclasses.count.should == 5
  end
end