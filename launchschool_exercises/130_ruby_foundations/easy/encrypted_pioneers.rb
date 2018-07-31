def rot13(str)
  letters = ('a'..'z').to_a
  decrypted_str = ''
  str.downcase.chars.each do |ch|
    if ch ==  ' '
      decrypted_str << ' '
    elsif ch ==  '-'
      decrypted_str << '-'
    elsif letters.find_index(ch) <= 12
      decrypted_str << letters[letters.find_index(ch) + 13]
    else
      decrypted_str << letters[letters.find_index(ch) - 13]
    end
  end
  decrypted_str.capitalize
end

puts rot13('Nqn Ybirynpr')
puts rot13('Tenpr Ubccre')
puts rot13('Nqryr Tbyqfgvar')
puts rot13('Nyna Ghevat')
puts rot13('Puneyrf Onoontr')
puts rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
puts rot13('Wbua Ngnanfbss')
puts rot13('Ybvf Unvog')
puts rot13('Pynhqr Funaaba')
puts rot13('Fgrir Wbof')
puts rot13('Ovyy Tngrf')
puts rot13('Gvz Orearef-Yrr')
puts rot13('Fgrir Jbmavnx')
puts rot13('Xbaenq Mhfr')
puts rot13('Fve Nagbal Ubner')
puts rot13('Zneiva Zvafxl')
puts rot13('Lhxvuveb Zngfhzbgb')
puts rot13('Unllvz Fybavzfxv')
puts rot13('Tregehqr Oynapu')
