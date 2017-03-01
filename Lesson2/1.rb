class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    puts "#{@first_name} #{@last_name}"
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
  
   def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith


=begin

#-------------------------------------------------------------------------------

#2

class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
  
  def name
    puts "#{@first_name} #{@last_name}"
  end
  
  
end


bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'


#----------------------------------------------------------------------------
#1

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

=end