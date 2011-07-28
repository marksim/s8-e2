module SpaceTruckin
  class Planet
    attr_reader :name
    attr_accessor :cargo
    attr_reader :demand
    attr_reader :routes

    def self.planets
      @planets ||= {}
    end

    def initialize(name)
      @name = name
      @cargo = 6
      @demand = 0
      @routes = []
    end

    def get_cargo(ratio=:all)
      case ratio
      when :all
        shipped = @cargo
        @cargo = 0
        return shipped
      when :half
        shipped = (@cargo / 2.0).ceil
        @cargo = @cargo-shipped
        return shipped
      end
    end

    def add_demand
      @demand += 1
    end

    def remove_demand
      @demand = 0
    end

    def add_route(route)
      @routes << route
    end

    def has_demand?
      @demand != 0
    end
  end
end