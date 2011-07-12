class Route
  attr_reader :to_planet
  attr_reader :length

  def to_s
    "#{length} to #{to_planet}"
  end
end