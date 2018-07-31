def oddities(arr)
  count = 1
  new_arr = []
  arr.each do |element|
    new_arr << element unless count % 2 == 0
    count += 1
  end

  new_arr
end

puts oddities([2, 3, 4, 5, 6]).inspect
puts oddities(['abc', 'def']).inspect
puts oddities([123]).inspect
puts oddities([]).inspect
