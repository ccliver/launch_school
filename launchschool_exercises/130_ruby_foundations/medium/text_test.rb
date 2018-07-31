require 'minitest/autorun'
require_relative 'text'
require 'minitest/reporters'
Minitest::Reporters.use!

class TextTest < MiniTest::Test
  def setup
    @sample_text = File.open('text.txt')
    @text = Text.new(@sample_text.read)
  end

  def test_swap
    expected_text = <<~EOF
Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
et verius meuris, et pheretre mi.
    EOF
    assert_equal(@text.swap('a', 'e'), expected_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardwon
    @sample_text.close
  end
end
