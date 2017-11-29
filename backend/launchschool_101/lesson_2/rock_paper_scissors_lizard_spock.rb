VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def display_result(player, computer, totals)
  if win?(player, computer)
    prompt('You won!')
    totals[:player] += 1
  elsif win?(computer, player)
    prompt('Computer won!')
    totals[:computer] += 1
  else
    prompt("It's a tie!")
  end
end

choice = ''
totals = { player: 0, computer: 0 }
loop do
  loop do
    msg = ''
    VALID_CHOICES.keys.each { |k| msg << "#{k}) #{VALID_CHOICES[k]}, " }
    prompt("Choose one: #{msg.gsub(/, $/, '')}")
    choice = gets.chomp

    if VALID_CHOICES.keys.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer = VALID_CHOICES.values.sample

  puts "Your choice #{VALID_CHOICES[choice]}; Computer chose: #{computer}"
  display_result(VALID_CHOICES[choice], computer, totals)

  prompt('Do you want to play again (y/n)?')
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

puts "\n"
puts "Player wins: #{totals[:player]}"
puts "Computer wins: #{totals[:computer]}"
