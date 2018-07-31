class SecretHandshake
  def initialize(handshake)
    if handshake.class == Integer
      @handshake = handshake.to_s(2)
    else
      @handshake = handshake.to_i(2).to_s(2)
    end
  end

  def commands
    command_map = {
      0 => 'wink',
      1 => 'double blink',
      2 => 'close your eyes',
      3 => 'jump'
    }

    return [] if @handshake == '0'

    command_list = []
    @handshake.chars.reverse.each_with_index do |digit, index|
      if index == 4 && digit == '1'
        command_list.reverse!
        break
      end

      command_list << command_map[index] if digit == '1'
    end
    command_list
  end
end
