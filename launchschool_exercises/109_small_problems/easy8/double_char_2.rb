def double_consonants(str)
  new_str = []
  str.each_char do |ch|
    if ch =~ /[aeiou\W\d]/
      new_str << ch
    else
      new_str << ch << ch
    end
  end
  new_str.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
