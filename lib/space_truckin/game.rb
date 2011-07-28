module SpaceTruckin
  class Game
    attr_reader :current_player
    attr_accessor :players
    attr_accessor :planets
    attr_accessor :routes
    attr_accessor :deck
    attr_accessor :face_up
    attr_accessor :demand_chips
    attr_reader :stages
    attr_reader :stage

    def initialize(*player_names)
      @planets = []
      planet_names = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Tatooine"]
      planet_names.each do |planet_name|
        @planets << Planet.new(planet_name)
      end

      home_planets = @planets.shuffle[0,3]

      (player_names.length..2).each {|i| player_names << "Player #{i+1}"}
      @players = []
      player_names.each do |name|
        @players << Player.new(name, home_planets.shift)
      end

      @demand_chips = 50

      @deck = Deck.new(60)
      @deck.shuffle

      4.times do 
        @players.each do |player|
          player.resources << @deck.draw
        end
      end

      @face_up = []
      5.times do
        @face_up << @deck.draw
      end

      @stage = nil
      @current_player = @players.first
    end

    def play_loop
      puts "Welcome to Space Truckin!"
      until game_over
        @stages = Stage.names

        @players.each do |player|
          puts "\n\nYour turn, #{player.name}\n"
          stage = select_stage
          stage.execute(players_in_order_from(player))
        end
        rotate_players
      end

      puts "And the winner is... #{@players.sort_by {|p| p.victory_points}.last.name}"
    end

    def game_over
      (planets.inject(0) {|t, c| t += c.cargo} == 0) || 
        ((@demand_chips == 0) && (routes.select(&:uncontrolled?).any?))
    end

    def select_stage

      name = menu("Select Stage", @stages)

      if @stages.include?(name)
        @stage = Stage.stages[name]
        @stages.delete(name)
      end

      @stage
    end


    private

    def players_in_order_from(player)
      players = @players.dup
      until player == players.first
        players << players.shift
      end
      players
    end

    def rotate_players
      @players << @players.shift
    end

    def menu(title, *values)
      puts title
      puts "------------------------------------"
      i = 1
      values = values.flatten
      values.each do |value|
        puts "#{i}) #{value}"
        i+=1
      end
      puts "------------------------------------"
      print "> "
      index = gets
      values[(index.to_i)-1]
    end
  end
end