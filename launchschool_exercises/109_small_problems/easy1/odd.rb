def is_odd?(num)
  if num % 2 == 1
    return true
  end
end

print "Enter an integer: "
num = gets.chomp.to_i
if is_odd?(num)
  puts "That number is odd"
else
  puts "That number is even"
end
