def substrings_at_start(str)
  new_arr = []
  str.split('').each_index do |x|
    new_element = ''
    0.upto(x).each do |y|
      new_element << str[y]
    end
    new_arr << new_element
  end
  new_arr
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
