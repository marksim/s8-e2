class Card
  TYPES = [:food, :ship, :mine, :fuel]

  attr_reader :type
  def initialize(type)
    throw "Invalid Type" unless TYPES.include?(type)
    @type = type
  end

  def to_s
    @type.to_s.capitalize
  end

  def <=>(b)
    self.to_s <=> b.to_s
  end
end