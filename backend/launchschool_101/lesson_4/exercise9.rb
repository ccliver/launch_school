def titleize(words)
  last_character = ''
  titleized = ''
  words.chars.each do |letter|
    if last_character == '' or last_character == ' '
      puts letter
      titleized << letter.upcase
    else
      titleized << letter
    end
    last_character = letter
  end
  titleized
end

puts titleize("the flintstones rock")
