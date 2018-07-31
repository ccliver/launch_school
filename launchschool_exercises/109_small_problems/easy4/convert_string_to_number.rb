STR_TO_INT = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def string_to_integer(num)
  total = 0
  multiplier = 1

  num.reverse.split('').each do |n|
    n = STR_TO_INT[n]
    total += n * multiplier
    multiplier *= 10
  end
  total
end

puts string_to_integer('4321')
puts string_to_integer('570')