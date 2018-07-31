class GuessingGame
  def initialize
    @guess_limit = 7
    @start_num = 1
    @end_num = 100
    @target_num = (@start_num..@end_num).to_a.sample
  end

  def play
    loop do
      puts "You have #{@guess_limit} guess#{'es' if @guess_limit > 1} remaining."
      number = nil
      loop do
        print "Enter a number between #{@start_num} and #{@end_num}: "
        number = gets.chomp.to_i
        break if number >= @start_num && number <= @end_num
      end
  
      if number == @target_num
        puts "You win!"
        return
      elsif number < @target_num
        puts "Your guess is too low."
      else
        puts "Your guess is too high."
      end

      @guess_limit -= 1
      if @guess_limit == 0
        puts "You are out of guesses, you lose."
        return
      end
    end
  end
end

GuessingGame.new.play
