def crunch(str)
  str.squeeze('0-9a-zA-Z')
end

puts crunch('ddaaiillyy ddoouubbllee') # == 'daily double'
puts crunch('4444abcabccba') # == '4abcabcba'
puts crunch('ggggggggggggggg') # == 'g'
puts crunch('a') # == 'a'
puts crunch('') # == ''
