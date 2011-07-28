module SpaceTruckin
  class Route
    attr_reader :planet_a
    attr_reader :planet_b
    attr_reader :length

    attr_accessor :controlled_by
    attr_accessor :mines
    attr_accessor :usable

    def initialize(planet_a, planet_b, length)
      @planet_a      = planet_a
      @planet_b      = planet_b
      @length        = length
      @controlled_by = nil
      @protected     = false
      @usable        = true

      @planet_a.add_route(self)
      @planet_b.add_route(self)
    end

    def to_s
      "#{@planet_a.name} -(#{@length})- #{@planet_b.name}"
    end

    def uncontrolled?
      !@controlled
    end

    def control_cost
      [SpaceTruckin::Card.set_of(:food, (@length/2)), SpaceTruckin::Card.set_of(:ship, ((@length/3)+1))].flatten
    end

    def travel_cost
      SpaceTruckin::Card.set_of(:fuel, ((@length/2)+1))
    end

    def protection_cost
      SpaceTruckin::Card.set_of(:mine, ((@length/4)+2))
    end

    def controlled?
      !@controlled_by.nil?
    end

    def controlled_by?(player)
      @controlled_by == player
    end

    def protected?
      !!@mines
    end

    def control_by(player)
      @controlled_by = player
    end

    def travel_from(planet)
      (planet == @planet_a) ? @planet_b : @planet_a
    end

    def protect
      @mines = true
    end

    def attack
      if protected?
        @mines = false
      else
        @usable = false
      end
    end

    def clear_attack
      @usable = true
    end

    def usable?
      !!@usable
    end

    def state
      if usable? && controlled?
        if protected?
          "protected"
        else
          "usable"
        end
      else
        "unusable"
      end
    end
  end
end