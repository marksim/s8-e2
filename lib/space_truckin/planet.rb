module SpaceTruckin
  class Planet
    attr_reader :name
    attr_reader :routes

    def self.planets
      @planets ||= {}
    end

    def initialize(name, routes={})
      @name = name
      self.class.planets[name] = self
      @routes = []

      routes.each do |k,v|
        p = (self.class.planets[k] || Planet.new(k))
        @routes << Route.new(p, v)
      end
    end

    def to_s
      "#{@name} : #{routes.collect}"
    end

    def self.all
      @planets.values
    end

    def self.clear
      @planets = {}
    end
  end
end