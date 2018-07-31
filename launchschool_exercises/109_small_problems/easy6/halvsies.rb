def halvsies(arr)
  new_arr = []
  if arr.length.odd?
    new_arr << arr.slice(0, (arr.length / 2) + 1)
    new_arr << arr.slice((arr.length / 2) + 1, arr.length)
  else
    new_arr << arr.slice(0, arr.length / 2)
    new_arr << arr.slice(arr.length / 2, arr.length)
  end
  new_arr
end

p halvsies([1, 2, 3, 4]) # == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # == [[1, 5, 2], [4, 3]]
p halvsies([5]) # == [[5], []]
p halvsies([]) # == [[], []]
