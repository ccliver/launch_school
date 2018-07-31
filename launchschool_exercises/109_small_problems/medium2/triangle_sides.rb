def triangle(a, b, c)
  return :invalid if a == 0 || b == 0 || c == 0
  sides = [a, b, c].sort.reverse
  return :invalid if sides[0] > sides[1] + sides[2]

  if a == b && b == c && a == c
    return :equilateral
  elsif a != b && b != c && a != c 
    return :scalene
  elsif (a == b && b != c && a != c) ||
        (b == c && a != b && a != c)
    return :isosceles
  else
    return :invalid
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid
