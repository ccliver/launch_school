def sum_square_difference(num)
  total_squared = 0
  total_squares = 0
  1.upto(num) { |x| total_squared += x.to_i }
  total_squared *= total_squared
  1.upto(num) { |x| total_squares += x.to_i * x.to_i }
  total_squared - total_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
