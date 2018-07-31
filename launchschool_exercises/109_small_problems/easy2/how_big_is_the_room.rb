print 'Enter the length in meters of the room: '
length = gets.chomp
print 'Enter the width in meters of the room: '
width = gets.chomp

puts "The area of the room is #{length.to_f * width.to_f} square meters (#{(length.to_f * width.to_f) * 10.7639} square feet)."
