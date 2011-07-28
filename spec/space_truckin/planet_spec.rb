require 'spec_helper'

describe SpaceTruckin::Planet do
  it "can get cargo from the planet" do
    p = SpaceTruckin::Planet.new("Pluto")
    p.get_cargo(:all).should == 6

    p = SpaceTruckin::Planet.new("Jupiter")
    p.get_cargo(:half).should == 3
    p.get_cargo(:half).should == 2
    p.get_cargo(:half).should == 1
    p.get_cargo(:half).should == 0
  end
end