def sum_of_sums(arr)
  new_arr = []
  arr.each_index do |x|
    next_element = []
    (0..x).each { |y| next_element << arr[y] }
    new_arr << next_element
  end
  new_arr.flatten.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
