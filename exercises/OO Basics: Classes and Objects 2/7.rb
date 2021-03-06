=begin
Identify Yourself (Part 2)

Modify the following code so that I'm Sophie! is printed when puts kitty is invoked.

Expected output:
I'm Sophie!
=end
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    "I'm #{name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty
