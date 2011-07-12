require 'spec_helper'

describe SpaceTruckin::Planet do
  it "has routes to other planets" do
    p = SpaceTruckin::Planet.new("Pluto", {'Mercury' => 10, 'Jupiter' => 4, 'Neptune' => '2'})
    p.routes.length.should == 3
  end

  it "shows a list of all planets upon request" do
    SpaceTruckin::Planet.clear
    SpaceTruckin::Planet.new("Mercury")
    SpaceTruckin::Planet.new("Venus")
    SpaceTruckin::Planet.new("Earth")
    SpaceTruckin::Planet.new("Mars")

    planets = SpaceTruckin::Planet.all
    planets.length.should == 4
  end
end