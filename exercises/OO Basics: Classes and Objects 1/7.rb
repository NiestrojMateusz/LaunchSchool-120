

class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello I'm #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
