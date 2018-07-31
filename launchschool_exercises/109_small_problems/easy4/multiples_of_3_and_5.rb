def multisum(num)
  total = 0

  1.upto(num) do |x|
    if x % 3 == 0 || x % 5 == 0
      total += x
    end
  end
  total
end

puts multisum(3)
puts multisum(5)
puts multisum(10)
puts multisum(1000)
