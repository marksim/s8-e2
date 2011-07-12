module SpaceTruckin
  class Game
    attr_accessor :players

    def initialize(*player_names)
      (player_names.length..2).each {|i| player_names << "Player #{i+1}"}
      self.players = []
      player_names.each do |name|
        players << Player.new(name)
      end
    end

    def to_s
      ""
    end
  end
end