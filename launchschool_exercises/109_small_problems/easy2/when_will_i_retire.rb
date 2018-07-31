print 'What is your age? '
age = gets.chomp.to_i
print 'At what age would you like to retire? '
retire_age = gets.chomp.to_i

curr_year = Time.new.year
retire_year = curr_year + (retire_age - age)
years_left = retire_year - curr_year

puts "It's #{curr_year}. You will retire in #{retire_year}. You have only #{years_left} years of work to go!"
