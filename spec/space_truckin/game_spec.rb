require 'spec_helper'

describe SpaceTruckin::Game do
  it "has 3 players" do
    SpaceTruckin::Game.new.players.length.should == 3
  end

  it "allows for explicit names" do
    SpaceTruckin::Game.new("Mark", "Andrew", "Keith").players.collect(&:name).should == ["Mark", "Andrew", "Keith"]
  end

  it "fills in non-explicit names" do
    SpaceTruckin::Game.new("Mark", "Andrew").players.collect(&:name).should == ["Mark", "Andrew", "Player 3"]
  end
end