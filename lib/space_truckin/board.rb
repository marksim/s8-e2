module SpaceTruckin
  class Board

    class << self
      attr_reader :planets
      attr_reader :routes
    end

    def initialize
      raise "Cannot instanciate board class"
    end
  end
end