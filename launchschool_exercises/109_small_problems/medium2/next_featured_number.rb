def next_odd(num)
  return num + 1 if num.even?
  return num + 2 if num.odd?
end

def featured(num)
  next_featured = next_odd(num)
  loop do
    if next_featured % 7 == 0 &&
       next_featured == next_featured.to_s.split('').uniq.join.to_i
      return next_featured
    else
      next_featured = next_odd(next_featured)
    end
  end
  return next_featured
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
