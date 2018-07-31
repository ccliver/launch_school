def fibonacci(num)
  return 1 if num <= 2
  numbers = [1,1]
  idx = 2
  (num - 2).times do |num|
    numbers << numbers[idx - 2] + numbers[idx - 1]
    idx += 1
  end
  numbers[-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)  #== 4202692702.....8285979669707537501
