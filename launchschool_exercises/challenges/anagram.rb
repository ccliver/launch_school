class Anagram
  def initialize(word)
    @word = word
  end

  def match(potential_anagrams)
    verified_anagrams = []
    potential_anagrams.each do |word|
      next if @word.downcase == word.downcase # Skip duplicte words
      verified_anagrams << word if @word.downcase.chars.sort.join == word.downcase.chars.sort.join
    end
    verified_anagrams
  end
end
