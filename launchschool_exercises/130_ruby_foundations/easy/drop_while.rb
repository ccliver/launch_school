def drop_while(arr)
  new_arr = []
  arr.each do |element|
    if yield(element)
      new_arr << element
      return new_arr
    else
      new_arr << element
    end
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 }# == [5, 6]
p drop_while([]) { |value| true } == []
