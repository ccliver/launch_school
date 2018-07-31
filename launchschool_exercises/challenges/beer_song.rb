class BeerSong
  def verse(number)
    case number
      when 0
        return "No more bottles of beer on the wall, no more bottles of beer.\n" \
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      when 1
        return "1 bottle of beer on the wall, 1 bottle of beer.\n" \
          "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 2
        return "2 bottles of beer on the wall, 2 bottles of beer.\n" \
          "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      else
        return "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
          "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
      end
  end
  
  def verses(start_number, end_number)
    start_number.downto(end_number).map { |number| verse(number) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
