require 'spec_helper'

describe SpaceTruckin::Board do
  it "is a singleton" do
    lambda { SpaceTruckin::Board.new }.should raise_error
  end
end