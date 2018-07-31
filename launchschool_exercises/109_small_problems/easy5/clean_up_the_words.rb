def cleanup(string)
  string.gsub(/[^a-zA-Z]+/, ' ')
end

puts cleanup("---what's my +*& line?") # == ' what s my line '
