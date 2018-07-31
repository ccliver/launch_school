class PigLatin
  VOWELS = ['a', 'e', 'i', 'o', 'u'].freeze

  def self.translate(phrase)
    if phrase.split(' ').length == 1
      self.pigify_word(phrase)
    else
      pig_phrase = []
      phrase.split(' ').each { |word| pig_phrase << self.pigify_word(word) }
      pig_phrase.join(' ')
    end
  end
  
  def self.pigify_word(word)
    return word + 'ay' if VOWELS.include?(word[0])
    return word + 'ay' if word[0] == 'y' and word[1] == 't'
    return word + 'ay' if word[0] == 'x' and word[1] == 'r'

    suffix_chars = []
    word.chars.each do |ch|
      suffix_chars << ch unless VOWELS.include?(ch)

      suffix_chars << ch if suffix_chars[-1] == 'q' and ch == 'u'

      break if VOWELS.include?(ch)
    end
    return word.gsub(/^#{suffix_chars.join('')}/, '') + suffix_chars.join('') + 'ay'
  end
end
