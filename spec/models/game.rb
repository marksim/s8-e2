require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/game.rb'

describe Game do
  it "should be valid" do
    Game.new
  end
end