require "space_truckin/card"
require "space_truckin/deck"
require "space_truckin/game"
require "space_truckin/planet"
require "space_truckin/player"
require "space_truckin/route"
require "space_truckin/stage"

module SpaceTruckin
  def self.play(*players)
    Game.new(*players).play_loop
  end
end
