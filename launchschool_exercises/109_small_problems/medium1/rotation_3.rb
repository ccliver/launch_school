def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, rotate)
  (num.to_s.split('')[0..-rotate - 1].join +
    rotate_array(num.to_s.split('')[-rotate..-1]).join).to_i
end

def max_rotation(num)
  num_arr = num.to_s.chars
  new_arr = num_arr
  num_arr.each_with_index do |num, idx|
    new_arr = rotate_rightmost_digits(new_arr[idx..-1].join.to_i, new_arr[idx..-1].length).to_s.chars
  end
end

p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p rotate_rightmost_digits(35, 1)
#p max_rotation(105) #== 15 # the leading zero gets dropped
#p max_rotation(8_703_529_146) #== 7_321_609_845
