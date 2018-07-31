numbers = []

def prompt(number)
  if number == 1
    puts '=> Enter the 1st number: '
  elsif number == 2
    puts '=> Enter the 2nd number: '
  elsif number >= 3 && number < 6
    puts "=> Enter the #{number}th number: "
  else
    puts "=> Enter the last number: "
  end
end

(1..5).each do |num|
  prompt(num)
  numbers << gets.chomp.to_i
end
prompt(6)
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers.inspect}"
else
  puts "The number #{last_number} does not appear in #{numbers.inspect}"
end
