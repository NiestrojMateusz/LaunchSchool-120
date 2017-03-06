=begin
Reading and Writing
Add the appropriate accessor methods to the following code.
Expected output:
Jessica

=end

class Person
  attr_accessor :name
  
  def initialize
    @name = name
  end
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name