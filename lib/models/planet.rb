class Planet
  attr_reader :name
  attr_reader :routes

  def initialize(name, routes={})
    @name = name
    @@planets ||= {}
    @@planets[name] = self
    @routes = []

    routes.each do |k,v|
      p = (@@planets[k] || Planet.new(k))
      @routes << Route.new(p, v)
    end
  end

  def to_s
    "#{@name} : #{routes.collect}"
  end

  def self.all
    @@planets.values
  end

  def self.clear
    @@planets = {}
  end


end