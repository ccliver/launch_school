MADLIB_FILE='madlib.txt'

def madlib_replace(str)
  nouns = ['dog', 'cat', 'building', 'Donald Trump']
  verbs = ['kick', 'lick', 'fall', 'smell']
  adjectives = ['orange', 'furry', 'mean', 'happy']
  adverbs = ['slowly', 'very', 'strenuously', 'today']
  
  if str.include?('NOUN')
    return str.gsub(/NOUN/, nouns.sample)
  elsif str.include?('ADVERB')
    return str.gsub(/ADVERB/, adverbs.sample)
  elsif str.include?('VERB')
    return str.gsub(/VERB/, verbs.sample)
  elsif str.include?('ADJECTIVE')
    return str.gsub(/ADJECTIVE/, adjectives.sample)
  else
    return str
  end
end

madlib = File.read(MADLIB_FILE)
puts madlib.split(' ').map { |word| madlib_replace(word) }.join(' ')
