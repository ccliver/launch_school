def word_to_digit(str)
  str.gsub(/one/, '1').gsub(/two/, '2').gsub(/three/, '3').gsub(/four/, '4').gsub(/five/, '5').
      gsub(/six/, '6').gsub(/seven/, '7').gsub(/eight/, '8').gsub(/nine/, '9').gsub(/zero/, 0)
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
