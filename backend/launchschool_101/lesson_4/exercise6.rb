flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |val, index| flintstones[index] = val[0,3] }
puts flintstones.inspect
