def substrings(str)
  result = []
  0.upto(str.size - 1) do |start|
    start.upto(str.size - 1) do |index|
      result << str[start..index]
    end
  end
  result
end

def palindromes(str)
  substrings(str).keep_if { |str| str == str.reverse }.keep_if { |str| str.length > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
