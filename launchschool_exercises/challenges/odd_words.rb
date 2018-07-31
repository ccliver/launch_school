class OddWords
  def self.flip_odds(str)
    flipped_str = []
    str.split.each_with_index do |word, idx|
      if (idx).odd?
        flipped_str << word.reverse
      else
        flipped_str << word
      end

      flipped_str[-1] << '.' if idx == str.split.length - 1
    end
    flipped_str.join(' ')
  end
end
