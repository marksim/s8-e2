module SpaceTruckin
  class Stage
    class << self
      attr_accessor :stages
      attr_accessor :name

      def execute(players)
        puts "Executing #{@name}"
      end

      def names
        @stages.keys
      end
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

  end

  stage "Ship" do

  end

  stage "Protect" do

  end

  stage "Attack" do

  end


end