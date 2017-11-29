class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end
  
  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.rock?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.paper?) ||
      (scissors? && other_move.lizard?) ||
      (paper? && other_move.rock?) ||
      (paper? && other_move.spock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (rock? && other_move.spock?) ||
      (lizard? && other_move.rock?) ||
      (lizard? && other_move.scissors?) ||
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (scissors? && other_move.spock?) ||
      (scissors? && other_move.rock?) ||
      (paper? && other_move.scissors?) ||
      (paper? && other_move.lizard?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    self.score = 0
    self.history = []
  end
  
  def record_move(move)
    self.history << move
  end

  def display_history
    puts "\n#{name}'s history:"
    puts history.join("\n")
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "\nWhat's your name? "
      n = gets.chomp
      break unless n.empty?
      puts "\nSorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "\nPlease choose rock, paper, scissors, lizard, spock, or enter history to see previous moves: "
      choice = gets.chomp
      if choice == 'history'
        self.display_history
        next
      end
      self.record_move(choice)
      break if Move::VALUES.include?(choice)
      puts "\nSorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
  
  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.record_move(self.move)
  end
end

class RPSGame
  attr_accessor :human, :computer, :winning_score

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "\nWelcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "\nThanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "\n#{human.name} chose #{human.move}."
    puts "\n#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      human.score += 1
      puts "\n#{human.name} won this round and has #{human.score} points!"
      puts "\n#{human.name} won the game!" if human.score == self.winning_score
    elsif human.move < computer.move
      computer.score += 1
      puts "\n#{computer.name} won this round and has #{computer.score} points!"
      puts "\n#{computer.name} won the game!" if computer.score == self.winning_score
    else
      puts "\nThis round is a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    return false
  end

  def get_winning_score
    puts "\nWhat should the winning score be?"
    self.winning_score = gets.chomp.to_i
  end

  def play
    display_welcome_message
    get_winning_score

    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        break if human.score == self.winning_score ||
          computer.score == self.winning_score
      end
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
