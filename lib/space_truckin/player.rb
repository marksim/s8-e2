module SpaceTruckin
  class Player
    attr_accessor :name
    attr_accessor :location
    attr_accessor :resources
    attr_accessor :cargo
    
    def initialize(name, home_planet)
      self.name = name
      self.resources = []
      
      self.location = home_planet
      self.cargo = home_planet.get_cargo(:all)
    end

    def choose_stage(stage)
      
    end
  end
end