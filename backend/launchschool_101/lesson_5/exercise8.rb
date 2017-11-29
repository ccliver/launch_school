hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |k, strings|
  strings.each do |string|
    string.split('').each do |ch|
      puts ch if ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u'
    end
  end
end
