def xor?(a, b)
  if (a == true && b == false) || (a == false && b == true)
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)
