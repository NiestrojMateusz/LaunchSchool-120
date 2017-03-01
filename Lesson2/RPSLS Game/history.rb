class History
  include Displayable
  attr_accessor :matches
  def initialize
    @matches = []
  end
  
  def update_history(human_move, computer_move)
    matches << [human_move, computer_move]
  end
  
  def display_history(human_name, computer_name)
    puts "Rounds ".ljust(6) + "|" + " #{human_name}".center(20) + "|" + " #{computer_name}".center(20)
    separator
    matches.each_with_index do |moves, index|
      puts "#{index + 1}".center(6) + " |" + "#{moves[0]}".upcase.center(20) + "|" + "#{moves[1]}".upcase.center(20)
    end
    break_line
  end
  
  def reset_history
    self.matches = []
  end
end