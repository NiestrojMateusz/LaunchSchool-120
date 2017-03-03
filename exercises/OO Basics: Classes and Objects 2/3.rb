=begin
Identify Yourself (Part 1)

Using the following code, add a method named #identify that returns its calling object.

Examples:
#<Cat:0x007ffcea0661b8 @name="Sophie">
=end
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify 