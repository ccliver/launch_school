class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = []
  end

  def write(obj)
    raise BufferFullException if @buffer.length == @buffer_size

    @buffer.unshift obj
  end

  def write!(obj)
    return if obj.nil?
    read if @buffer.length == @buffer_size
    @buffer.unshift obj
  end

  def read
    raise BufferEmptyException if @buffer.length.zero?

    rval = nil
    while rval.nil?
      rval = @buffer.pop
      break if @buffer.empty?
    end
    rval
  end

  def clear
    @buffer = []
  end
end
