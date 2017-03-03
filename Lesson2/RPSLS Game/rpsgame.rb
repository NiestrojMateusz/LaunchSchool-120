class RPSGame
  include Displayable
  attr_accessor :human, :computer, :winner_score, :history

  def initialize
    @human = Human.new
    @computer = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    @history = History.new
  end

  def set_score_to_win
    return @winner_score if !@winner_score.nil?
    prompt "Please type a points need to win. Deafult value is 10"

    answer = nil
    loop do
      answer = gets.chomp
      answer = answer == "" ? 10 : answer.to_i
      break if answer >= 1
      prompt "Invalid input. You have to type a integer"
    end
    @winner_score = answer
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def winner?
    break_line
    if human.score == winner_score
      prompt "#{human.name} won the game!!!\n\n"
      reset_score
      true
    elsif computer.score == winner_score
      prompt "#{computer.name} won the game!!!\n\n"
      reset_score
      true
    else
      false
    end
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

  def play_round
    loop do
      human.choose
      computer.choose(history, human.score)
      history.update_history(human.move, computer.move)
      rounds_display
      break if winner?
    end
  end

  def play
    loop do
      display_welcome_message
      set_score_to_win
      play_round
      break unless play_again?
    end
    history.display_history(human.name, computer.name)
    display_goodbye_message
  end
end
