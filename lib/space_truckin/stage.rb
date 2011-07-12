module SpaceTruckin
  class Stage
  end

  def stage(name, &block)
    @stages ||= {}
    @stages[name] = Class.new(Stage, &block)
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