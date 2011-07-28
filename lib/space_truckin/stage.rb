module SpaceTruckin
  class Stage
    class << self
      attr_accessor :stages
      attr_accessor :name

      def play(players)
        stage = self.new(players)
        stage.setup
        yield stage
        stage.teardown
      end

      def names
        @stages.keys
      end
    end

    attr_accessor :players
    def initialize(players)
      @players = players
    end

    def setup
    end

    def teardown
      @players.first.remove_temporary_resources
    end
  end

  def stage(name, &block)
    Stage.stages ||= {}
    Stage.stages[name] = Class.new(Stage, &block)
    Stage.stages[name].name = name
  end
  module_function :stage

  stage "Demand" do
    
  end

  stage "Control" do
    def setup
      @players.first.resources << SpaceTruckin::Card.new(:fuel, :temporary => true)
      super
    end
  end

  stage "Ship" do
    def setup
      @players.first.resources << SpaceTruckin::Card.new(:fuel, :temporary => true)
      super
    end
  end

  stage "Protect" do
    def setup
      @players.first.resources << SpaceTruckin::Card.new(:fuel, :temporary => true)
      super
    end
  end

  stage "Attack" do
    def attack_type
      [:attack, :remove, :nothing][rand(3)]
    end
  end


end