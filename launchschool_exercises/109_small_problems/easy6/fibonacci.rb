def find_fibonacci_index_by_length(num)
  curr = 1
  last = 1
  index = 3
  loop do
    if (curr + last).to_s.length == num
      break
    end
    new_curr = curr + last
    last = curr
    curr = new_curr
    index += 1
  end
  index
end

puts find_fibonacci_index_by_length(2) # == 7
puts find_fibonacci_index_by_length(10) # == 45
puts find_fibonacci_index_by_length(100) # == 476
puts find_fibonacci_index_by_length(1000) # == 4782
puts find_fibonacci_index_by_length(10000) # == 47847
