module Displayable
  def prompt(string)
    puts "==> #{string}"
  end
  
  def prompt_center(string)
    puts "#{string.center(50)}"
  end
  
  def clear_screen
    system('clear') || system('cls')
  end
  
  def break_line
    puts "\n"
  end
  
  def separator(signs = 50)
    puts '=' * signs
  end
  
  def display_welcome_message
    prompt "Welcome #{human.name} to Rock, Paper, Scissors, Lizard, Spock Game!"
    separator(76)
    set_score_to_win
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end
  
  def display_moves
    separator
    prompt_center "#{human.name} chose #{human.move}"
    prompt_center "#{computer.name} chose #{computer.move}"
    separator
  end

  def display_score
      break_line
      prompt_center "#{human.name} have #{human.score} points"
      prompt_center "#{computer.name} have #{computer.score} points"
      break_line
      separator
  end
  
  def display_winner
    break_line
    if human.move > computer.move
      prompt_center "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      prompt_center "#{computer.name} won!"
      computer.score += 1
    else
      prompt_center "It's a tie!"
    end
  end
end