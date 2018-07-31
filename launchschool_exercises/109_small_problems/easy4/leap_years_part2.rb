def leap_year?(year)
  if year % 4 == 0  
    if year < 1752
      true
    elsif year % 100 == 0
      if year % 400 == 0
        true
      else
        false
    end
    else
      true
    end
  else
    false
  end
end

puts leap_year?(2016)
puts leap_year?(2015)
puts leap_year?(2100)
puts leap_year?(2400)
puts leap_year?(240000)
puts leap_year?(240001)
puts leap_year?(2000)
puts leap_year?(1900)
puts leap_year?(1752)
puts leap_year?(1700)
puts leap_year?(1)
puts leap_year?(100)
puts leap_year?(400)
