require "rubygems"
require "bundler/setup"

Bundler.require

require_rel "./models"

class Class
  def subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end