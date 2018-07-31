def count_occurrences(vehicles)
  seen = Hash.new(0)
  vehicles.each { |vehicle| seen[vehicle] += 1 }

  seen.each { |vehicle, times| puts "#{vehicle} => #{times}" }
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

