require 'rubygems'
require 'require_all'
require_rel '../spec_helper'

describe Planet do
  it "has routes to other planets" do
    p = Planet.new("Pluto", {'Mercury' => 10, 'Jupiter' => 4, 'Neptune' => '2'})
    p.routes.length.should == 3
  end

  it "shows a list of all planets upon request" do
    Planet.clear
    Planet.new("Mercury")
    Planet.new("Venus")
    Planet.new("Earth")
    Planet.new("Mars")

    planets = Planet.all
    planets.length.should == 4
  end
end