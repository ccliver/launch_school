def compute(num, op)
  if op == 's'
    count = 1
    total = 0
    while count <= num
      total += count
      count += 1
    end
  else
    count = 1
    total = 1
    while count <= num
      total *= count
      count += 1
    end
  end
  total
end

print '>> Please enter an integer greater than 0: '
num = gets.chomp.to_i

print ">> Enter 's' to compute the sum, 'p' to compute the product: "
op = gets.chomp
raise 'Invalid input' unless op.casecmp('s') || op.casecmp('p')

result = compute(num, op)
if op == 's'
  puts "The sum of the integers between 1 and #{num} is #{result}."
elsif op == 'p'
  puts "The product of the integers between 1 and #{num} is #{result}."
end
