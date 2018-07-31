require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_1
    assert_equal "whats eht matter htiw kansas.", OddWords.flip_odds("whats the matter with kansas")
  end
end
