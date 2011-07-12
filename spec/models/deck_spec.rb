require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Deck do
  it "has a specified number of cards" do
    Deck.new(60).cards.length == 60
  end

  it "has an evenly distributed number of each card type" do
    totals = {}
    Card::TYPES.each {|type| totals[type] = 0}
    Deck.new(8).cards.each {|card| totals[card.type] += 1}
    Card::TYPES.each {|type| totals[type].should == totals[:food]}
  end

  it "shuffles itself" do
    deck = Deck.new(20)
    deck.shuffle
    deck.cards.should_not == deck.cards.sort
  end

  it "removes a card when drawn" do
    deck = Deck.new(20)
    deck.draw
    deck.cards.length.should == 19
  end
end