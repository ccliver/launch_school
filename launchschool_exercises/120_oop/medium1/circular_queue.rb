class CircularQueue
  attr_accessor :buffer_size

  def initialize(buffer_size)
    self.buffer_size = buffer_size
    @buffer = Array.new()
  end

  def enqueue(obj)
    dequeue if @buffer.length == self.buffer_size
    @buffer.unshift obj
  end
  
  def dequeue
    rval = nil
    while rval == nil
      rval = @buffer.pop
      break if @buffer.length == 0
    end
    rval
  end
  
  def to_s
    @buffer
  end
end
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
