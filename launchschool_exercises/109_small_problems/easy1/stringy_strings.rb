def stringy(int)
  one = true
  string = ""
  int.times do
    if one
      string << "1"
      one = false
    else
      string << "0"
      one = true
    end
  end
  
  return string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
