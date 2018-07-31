def sum(int)
  sum = 0
  int.to_s.split('').each { |num| sum += num.to_i }
  return sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
