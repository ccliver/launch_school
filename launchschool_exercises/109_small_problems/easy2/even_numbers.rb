puts 'All odd numbers from 1 to 99, inclusive:'

(1..99).each { |num| puts num if num % 2 == 0 }
