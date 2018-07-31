module Walkable
  def walk
    "#{@name} #{gait} forward."
  end
end

class Noble
  include Walkable

  attr_reader :title, :name

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{@title} #{@name} #{gait} forward."
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
