module SpaceTruckin
  class Route
    attr_reader :planet_a
    attr_reader :planet_b
    attr_reader :length

    attr_accessor :controlled_by
    attr_accessor :protected

    def initialize(planet_a, planet_b, length)
      @planet_a = planet_a
      @planet_b = planet_b
      @length   = length
      @controlled_by = nil
      @protected     = false
    end

    def uncontrolled?
      !@controlled
    end
  end
end