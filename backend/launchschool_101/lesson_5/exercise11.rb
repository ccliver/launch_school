arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |x|
  x.select do |y|
    y % 3 == 0
  end
end
puts arr2.inspect
