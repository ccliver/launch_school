flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |val, index| puts "#{val} at index #{index}" if val.start_with?('Be') }
