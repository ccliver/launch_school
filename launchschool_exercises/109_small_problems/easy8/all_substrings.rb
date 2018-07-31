def substrings(str)
  result = []
  0.upto(str.size - 1) do |start|
    start.upto(str.size - 1) do |index|
      result << str[start..index]
    end
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
