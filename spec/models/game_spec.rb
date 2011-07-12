require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Game do
  it "responds to :to_s" do
    Game.new.should respond_to :to_s
  end

  it "has 3 players" do
    Game.new.players.length.should == 3
  end

  it "allows for explicit names" do
    Game.new("Mark", "Andrew", "Keith").players.collect(&:name).should == ["Mark", "Andrew", "Keith"]
  end

  it "fills in non-explicit names" do
    Game.new("Mark", "Andrew").players.collect(&:name).should == ["Mark", "Andrew", "Player 3"]
  end
end