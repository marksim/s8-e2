module SpaceTruckin
  class Card
    TYPES = [:food, :ship, :mine, :fuel]

    attr_reader :type
    def initialize(type)
      raise "Invalid Type" unless TYPES.include?(type)
      @type = type
    end

    def to_s
      @type.to_s.capitalize
    end

    def <=>(b)
      @type <=> b.type
    end
  end
end