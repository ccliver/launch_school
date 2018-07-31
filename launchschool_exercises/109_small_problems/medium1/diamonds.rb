def diamond(size)
  diamondtop = []
  diamondbottom = []
  1.upto(size) do |line|
    next if line.even?
    diamondtop << ('*' * line).center(size)
  end
  2.upto((size / 2) + 1) do |line|
    diamondbottom << diamondtop[-line]
  end
  puts diamondtop
  puts diamondbottom
end

diamond(1)
diamond(3)
diamond(9)
diamond(17)
