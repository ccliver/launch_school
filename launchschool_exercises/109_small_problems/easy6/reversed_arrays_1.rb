def reverse!(arr)
  rev_arr = []
  index = arr.length
  while index > 0
    rev_arr.push(arr[index-1])
    index -= 1
  end
  rev_arr.each_with_index { |_, idx| arr[idx] = rev_arr[idx] }
end

list = [1,2,3,4]
p list.object_id
p list
result = reverse!(list) # => [4,3,2,1]
p list.object_id
p list

list = %w(a b c d e)
p list.object_id
p list
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list.object_id
p list

list = ['abc']
p list.object_id
p list
reverse!(list) # => ["abc"]
p list.object_id
p list

list = []
p list.object_id
p list
reverse!(list) # => []
p list.object_id
p list
