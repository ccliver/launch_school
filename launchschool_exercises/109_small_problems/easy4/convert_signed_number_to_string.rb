INT_TO_STR = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}

def signed_integer_to_string(integer)
  if integer < 0 
    integer *= -1
    negative = true
  elsif integer == 0
    return '0'
  else
    negative = false
  end

  digits = integer.digits
  if negative
    return "-#{digits.each { |digit| INT_TO_STR[digit] }.join.reverse}"
  else
    return "+#{digits.each { |digit| INT_TO_STR[digit] }.join.reverse}"
  end
end

puts signed_integer_to_string(4321) # == '+4321'
puts signed_integer_to_string(-123) # == '-123'
puts signed_integer_to_string(0) # == '0'
