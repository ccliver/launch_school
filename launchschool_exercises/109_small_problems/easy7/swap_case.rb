def swapcase(str)
  str.split('').map do |ch|
    if ch =~ /[A-Z]/
      ch.downcase
    elsif ch =~ /[a-z]/
      ch.upcase
    else
      ch
    end
  end.join
end
p swapcase('CamelCase') # == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') # == 'tONIGHT ON xyz-tv'
