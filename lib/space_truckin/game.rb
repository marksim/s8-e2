module SpaceTruckin
  class Game
    attr_accessor :players
    attr_accessor :planets
    attr_accessor :routes
    attr_accessor :deck
    attr_accessor :demand_chips
    attr_reader :stages

    def initialize(*player_names)
      @planets = []
      planet_names = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Tatooine"]
      planet_names.each do |planet_name|
        @planets << Planet.new(planet_name)
      end

      @routes = []
      @planets.each_with_index do |planet_a, index|
        [@planets[(index+2) % 9], @planets[(index + 5) % 9]].each do |planet_b|
          @routes << Route.new(planet_a, planet_b, 2+rand(4))
        end
      end

      home_planets = @planets.shuffle[0,3]

      (player_names.length..2).each {|i| player_names << "Player #{i+1}"}
      @players = []
      player_names.each do |name|
        @players << Player.new(self, name, home_planets.shift)
      end

      @demand_chips = 40

      @deck = Deck.new(60)
      @deck.shuffle

      4.times do |i|
        @players.each do |player|
          player.resources << @deck.draw
        end
      end
    end

    def play_stage(stage_name, first_player, &block)
      select_stage(stage_name).play(players_in_order_from(first_player), &block)
    end

    def finished?
      (planets.inject(0) {|t, c| t += c.cargo} == 0) || 
        ((@demand_chips == 0) && (routes.select(&:uncontrolled?).any?))
    end

    def select_stage(name)
      if @stages.include?(name)
        @stages.delete(name)
        return Stage.stages[name]
      end
    end

    def available_stages
      @stages
    end

    def reset_stages
      @stages = Stage.names
    end

    def rotate_players
      @players << @players.shift
    end

    def players_in_order_from(player)
      players = @players.dup
      until player == players.first
        players << players.shift
      end
      players
    end

    def clear_attacked_routes
      @routes.each do |route|
        route.clear_attack
      end
    end

    def controlled_routes
      @routes.select(&:controlled?)
    end

    def add_demand_to(planet)
      @demand_chips -= 1
      planet.add_demand
    end

    def standings
      players.sort_by(&:victory_points).reverse
    end
  end
end