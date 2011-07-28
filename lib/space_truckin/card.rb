module SpaceTruckin
  class Card
    TYPES = [:food, :ship, :mine, :fuel]

    attr_reader :type
    attr_reader :temporary
    def initialize(type, options={})
      raise "Invalid Type" unless TYPES.include?(type)
      @type = type
      @temporary = !!options[:temporary]
    end

    def to_s
      @type.to_s.capitalize
    end

    def temporary?
      @temporary
    end

    def <=>(b)
      @type <=> b.type
    end

    def self.set_of(type, size)
      Array.new(size).fill(type)
    end
  end
end