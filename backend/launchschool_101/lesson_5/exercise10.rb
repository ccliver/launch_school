arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

puts arr.inspect
arr2 = arr.map do |x|
  hsh = {}
  x.each do |k, v|
    hsh[k] = v + 1
  end
  hsh
end
puts arr2.inspect
