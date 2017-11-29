arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.each_with_index do |x, index|
  arr[index] = x.sort.reverse
end
puts arr.inspect
