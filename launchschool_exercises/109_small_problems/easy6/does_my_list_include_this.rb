def include?(arr, item)
  included = false
  arr.each { |val| included = true if val == item }
  included
end

p include?([1,2,3,4,5], 3) # == true
p include?([1,2,3,4,5], 6) # == false
p include?([], 3) # == false
p include?([nil], nil) # == true
p include?([], nil) # == false
