def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index { |_, idx| new_arr << [arr1[idx], arr2[idx]] }
  new_arr.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # == [1, 'a', 2, 'b', 3, 'c']
