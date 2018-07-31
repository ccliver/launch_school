def letter_percentages(str)
  totalup = 0
  totallow = 0
  totalneither = 0
  str.chars do |ch|
    if ch =~ /[A-Z]/
      totalup += 1
    elsif ch =~ /[a-z]/
      totallow += 1
    else
      totalneither += 1
    end
  end
  
  total =  totalup + totallow + totalneither
  { lowercase: totallow > 0 ? totallow / total.to_f * 100 : totallow,
    uppercase: totalup > 0 ? totalup / total.to_f * 100 : totallow,
    neither: totalneither > 0 ? totalneither / total.to_f * 100 : totalneither }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
