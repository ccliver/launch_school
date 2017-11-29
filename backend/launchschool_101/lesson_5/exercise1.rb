arr = ['10', '11', '9', '7', '8']

arr.each_with_index { |_, x| arr[x] = arr[x].to_i }
arr = arr.sort.reverse
puts arr.inspect
