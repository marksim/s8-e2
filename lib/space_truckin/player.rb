module SpaceTruckin
  class Player
    attr_accessor :game    
    attr_accessor :name
    attr_accessor :location
    attr_accessor :resources
    attr_accessor :cargo
    
    def initialize(game, name, home_planet)
      @game = game
      @name = name
      @resources = []
      
      @location = home_planet
      @cargo = home_planet.get_cargo(:all)
      @sold_cargo = 0
    end

    def to_s
      "#{@name} (@#{@location.name}, ##{@cargo}) - (#{@resources})"
    end

    def should_discard_under_attack?
      @resources.length > 7
    end

    def draw
      unless @game.deck.empty?
        @resources << @game.deck.draw
      end
    end

    def victory_points
      controlled_routes.inject(0) {|t, r| t += r.length}.to_i + @sold_cargo.to_i
    end

    def controlled_routes
      game.routes.select{|r| r.controlled_by?(self)}
    end

    def can_control?(route)
      route.uncontrolled? && has?(route.control_cost)
    end

    def control(route)
      return false unless can_control?(route)
      discard(route.control_cost)
      route.controlled_by = self
    end

    def can_travel?(route)
      has?(route.travel_cost) && 
        (@location == route.planet_a || @location == route.planet_b) &&
        route.controlled_by == self &&
        route.usable?
    end

    def travel(route)
      return false unless can_travel?(route)
      discard(route.travel_cost)
      @location = route.travel_from(@location)
    end

    def can_protect?(route)
      has?(route.protection_cost) && route.controlled_by?(self) && !route.protected?
    end

    def protect(route)
      return false unless can_protect?(route)
      discard(route.protection_cost)
      route.protect
    end

    def has?(*resource_types)
      x = @resources.map(&:type)
      resource_types.flatten.each do |resource_type|
        if (i = x.index(resource_type))
          x.delete_at(i)
        else
          return false
        end
      end
      true
    end

    def sell(amount)
      amount = [@cargo, amount].min
      @sold_cargo += @location.demand * amount
      @cargo -= amount
      @location.remove_demand
    end

    def remove_temporary_resources
      @resources.delete_if {|c| c.temporary?}
    end

    def discard(*resource_types)
      resource_types = resource_types.flatten
      return false unless has?(resource_types)
      resource_types.each do |type|
        if (i = @resources.index {|r| r.type == type && r.temporary?})
          @resources.delete_at(i)
        elsif (i = @resources.index {|r| r.type == type})
          @game.deck.return_card(@resources[i])
          @resources.delete_at(i)
        end
      end
      true
    end
  end
end