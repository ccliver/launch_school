def triangle(a, b, c)
  return :invalid if a == 0 || b == 0 || c == 0
  return :invalid if a + b + c != 180
  return :right if a == 90 || b == 90 || c == 90
  return :acute if a < 90 && b < 90 && c < 90
  return :obtuse if a > 90 || b > 90 || c > 90
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
