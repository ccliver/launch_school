def running_total(numbers)
  total = 0
  numbers.map { |x| total += x }
end

puts running_total([2, 5, 13]).inspect
puts running_total([14, 11, 7, 15, 20]).inspect
puts running_total([3]).inspect
puts running_total([]).inspect
