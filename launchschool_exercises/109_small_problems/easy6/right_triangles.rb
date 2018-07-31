def triangle(size)
  triangle = []
  (1..size).each { |stars| triangle << format("%#{size}s", '*' * stars) }
  triangle.join("\n")
end

puts triangle(5)
puts triangle(9)
