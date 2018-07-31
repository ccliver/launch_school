def digit_list(int)
  list = []
  int.to_s.split('').each { |x| list << x.to_i }
  return list
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
