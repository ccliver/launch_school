def swap(string)
  words = []
  string.split(' ').each do |word|
    chars = word.chars
    first_ch = chars.shift
    last_ch = chars.pop
    words << "#{last_ch}#{chars.join('')}#{first_ch}"
  end
  words.join(' ')
end

puts swap('Oh what a wonderful day it is') # == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') # == 'ebcdA'
puts swap('a') # == 'a'
