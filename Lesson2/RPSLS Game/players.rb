class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  include Displayable
  def set_name
    n = ''
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value"
    end
    self.name = n
    clear_screen
  end

  def choose
    choice = nil
    loop do
      prompt "Please choose (r)ock, (p)aper, (s)cissors, (l)izard, spoc(k):"
      choice = gets.chomp.downcase # temporary varialbe
      break if Move::VALUES.key?(choice.to_sym)
      prompt "Sorry, invalid choice."
    end
    self.move = Move.new(Move::VALUES[choice.to_sym])
    clear_screen
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose(_history, _score)
    self.move = Move.new(Move::VALUES.values.sample) # returning the new Move object
    # and that object will have a value of either rock paper scissors
  end
end

class R2D2 < Computer
  def set_name
    self.name = "R2D2"
  end
  
  def choose(_history, _score)
    self.move = Move.new("spock")
  end
end

class Hal < Computer
  def set_name
    self.name = "Hal"
  end
  
  def choose(_history, _score)
    self.move = Move.new(["spock", "lizard"].sample)
  end
end

class Chappie < Computer
  def set_name
    self.name = "Chappie"
  end
  
  def choose(_history, _score)
    self.move = Move.new(Move::VALUES.values[0..2].sample)
  end
end
  
class Sonny < Computer
  def set_name
    self.name = "Sonny"
  end
 
  def choose(history, score)
    if history.matches.empty?
      self.move = Move.new(Move::VALUES.values.sample)
    elsif  score > self.score
      self.move = history.matches.last[0]
    else
      self.move = history.matches.last[1]
    end  
  end
end  

class Number5 < Computer
  def set_name
    self.name = 'Number 5'
  end
end