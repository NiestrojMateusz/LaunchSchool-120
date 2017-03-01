require 'pry'
module DisplayTools
  def prompt(string)
    puts "==> #{string}"
  end
  
  def clear_screen
    system('clear') || system('cls')
  end
end

class History
  attr_accessor :matches
  def initialize
    @matches = []
  end
  
  def update_history(human_move, computer_move)
    matches << [human_move, computer_move]
  end
  
  def display_history(human_name, computer_name)
    matches.each_with_index do |moves, index|
      puts "Round #{index + 1} #{human_name}: #{moves[0]} #{computer_name}: #{moves[1]}"
    end
  end
  
  def reset_history
    self.matches = []
  end
end

class Move
  VALUES = {'r': 'rock', 'p': 'paper', 's': 'scissors', 'l': 'lizard', 'k':  'spock'}

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end
  
  def lizard?
    @value == 'lizard'
  end
  
  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (rock? && other_move.lizard?) ||
      (paper? && other_move.spock?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.rock?) ||
      (spock? && other_move.scissors?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?) ||
      (rock? && other_move.spock?) ||
      (paper? && other_move.lizard?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.rock?) ||
      (lizard? && other_move.scissors?) ||
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  include DisplayTools
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

  def choose
    self.move = Move.new(Move::VALUES.values.sample) # returning the new Move object
    # and that object will have a value of either rock paper scissors
  end
end

class RPSGame
  include DisplayTools
  attr_accessor :human, :computer, :winner_score, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end
  
  def set_score_to_win
    return @winner_score if @winner_score != nil
    prompt "Please write a point player have to reach to win. Deafult value is 10"
    
    answer = nil
    loop do
      answer = gets.chomp
      answer = answer == "" ? 10 : answer.to_i
      break if answer > 1
      prompt "Invalid input. You have to type a integer"
    end
    @winner_score = answer
    
  end
  
  def display_welcome_message
    prompt "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock Game!"
    set_score_to_win
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      prompt "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      prompt "#{computer.name} won!"
      computer.score += 1
    else
      prompt "It's a tie!"
    end
  end
  
  def reset_score
    human.score = 0
    computer.score = 0
  end
  
  def winner?
    if human.score == winner_score
      prompt "#{human.name} won the game!!!"
      reset_score
      false
    elsif computer.score == winner_score
      prompt "#{computer.name} won the game!!!"
      reset_score
      false
    else
      true
    end
  end

  def display_score
    puts "#{human.name} have #{human.score} points"
    puts "#{computer.name} have #{computer.score} points\n\n"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    
    clear_screen  
    return false if answer == 'n'
    history.reset_history
    return true if answer == 'y'
  end

  def play
    loop do
      display_welcome_message
      loop do
        human.choose
        computer.choose
        history.update_history(human.move, computer.move)
        display_moves
        display_winner
        display_score
        break unless winner?
      end
      break unless play_again?
    end
    history.display_history(human.name, computer.name)
    display_goodbye_message
  end
end

RPSGame.new.play
