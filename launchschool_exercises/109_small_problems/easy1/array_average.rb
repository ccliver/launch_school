def average(arr)
  sum = 0
  arr.each { |x| sum += x }
  sum / arr.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
