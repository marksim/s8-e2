module SpaceTruckin
  class Planet
    attr_reader :name
    attr_accessor :cargo

    def self.planets
      @planets ||= {}
    end

    def initialize(name)
      @name = name
      @cargo = 6
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
  end
end