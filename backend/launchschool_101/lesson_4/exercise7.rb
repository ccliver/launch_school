statement = "The Flintstones Rock"

letter_frequency = Hash.new(0)
statement.split('').each { |letter| letter_frequency[letter] += 1 }
puts letter_frequency.inspect
