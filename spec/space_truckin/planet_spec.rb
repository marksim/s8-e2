require 'spec_helper'

describe SpaceTruckin::Planet do
  it "has routes to other planets" do
    p = SpaceTruckin::Planet.new("Pluto", {'Mercury' => 10, 'Jupiter' => 4, 'Neptune' => '2'})
    p.routes.length.should == 3
  end
end