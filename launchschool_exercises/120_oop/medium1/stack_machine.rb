class Minilang
  VALID_OPERATORS = ['PUSH', 'ADD', 'SUB',
    'MULT', 'DIV', 'MOD', 'POP', 'PRINT'].freeze

  def initialize(program)
    @register = 0
    @stack = []
    @program = program

    @program.split.each do |token|
      unless VALID_OPERATORS.include?(token) || /^[\-0-9]+$/.match?(token)
        raise "Invalid token in program: #{token}"
      end
    end
  end

  def eval
    @program.split.each do |token|
      case token
        when 'PUSH' then push
        when 'ADD' then add
        when 'SUB' then sub
        when 'MULT' then mult
        when 'DIV' then div
        when 'MOD' then mod
        when 'POP' then pop
        when 'PRINT' then puts @register
        else @register = token.to_i
      end
    end
  end

  private

  def push
    @stack.push(@register)
  end

  def add
    @register += @stack.pop
  end
  
  def sub
    @register -= @stack.pop
  end
  
  def mult
    @register *= @stack.pop
  end
  
  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end
  
  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

begin
  Minilang.new('-3 PUSH 5 XSUB PRINT').eval
  # Invalid token: XSUB
rescue RuntimeError => e
  puts "ERROR: #{e}"
end

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
