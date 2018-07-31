def calculate_bonus(salary, half)
  if half
    return salary / 2
  else
    return 0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
