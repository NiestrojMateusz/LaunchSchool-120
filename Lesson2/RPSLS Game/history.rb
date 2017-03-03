class History
  include Displayable
  attr_accessor :matches
  def initialize
    @matches = []
  end

  def update_history(human_move, computer_move)
    matches << [human_move, computer_move]
  end

  def display_history(human_name, comp_name)
    display_header(human_name, comp_name)
    separator
    display_matches
    break_line
  end

  def reset_history
    self.matches = []
  end
end
