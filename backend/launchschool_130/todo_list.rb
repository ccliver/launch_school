class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def to_s
    todos = @todos.map { |todo| "#{todo}" }
    todos.join("\n")
  end

  def add(todo)
    raise TypeError unless todo.class == Todo
    @todos << todo
  end
  alias_method :<<, :add

  def size
    @todos.length
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index = nil)
    raise ArgumentError unless index
    raise IndexError if index > @todos.length - 1
    @todos[index]
  end

  def mark_done_at(index = nil)
    raise ArgumentError unless index
    raise IndexError if index > @todos.length - 1
    @todos[index].done!
  end

  def mark_undone_at(index = nil)
    raise ArgumentError unless index
    raise IndexError if index > @todos.length - 1
    @todos[index].undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def remove_at(index = nil)
    raise ArgumentError unless index
    raise IndexError if index > @todos.length - 1
    @todos.delete_at(index)
  end

  def todos
    @todos
  end

  def each
    @todos.each do |todo|
      yield todo
    end
    self
  end

  def select
    new_list = TodoList.new(@title)
    @todos.each do |todo|
      new_list << todo if yield todo 
    end
    new_list
  end
  
  def find_by_title(title)
    self.each { |todo| return todo if todo.title == title }
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| ! todo.done? }
  end

  def mark_done(title)
    self.each do |todo|
      if todo.title == title
        todo.done!
        return
      end
    end
    nil
  end

  def mark_all_done
    self.each { |todo| todo.done! }
  end

  def mark_all_undone
    self.each { |todo| todo.undone! }
  end

  def to_a
    @todos
  end
  
  def done!
    @todos.each { |todo| todo.done! }
  end
end

=begin
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.mark_done_at(1)
list.mark_done_at(2)
list.each do |todo|
  puts todo
end
list.mark_undone_at(2)
puts list.select { |todo| todo.done? }
puts
begin
  list.add(1)                     # raises TypeError with message "Can only add Todo objects"
rescue TypeError
  puts "Got TypeError as expected."
end

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
begin
  list.item_at                    # raises ArgumentError
rescue ArgumentError
  puts "Got ArgumentError as expected."
end
list.item_at(1)                 # returns 2nd item in list (zero based index)
begin
  list.item_at(100)               # raises IndexError
rescue IndexError
  puts "Got IndexError as expected."
end

# ---- Marking items in the list -----

# mark_done_at
begin
  list.mark_done_at               # raises ArgumentError
rescue ArgumentError
  puts "Got ArgumentError as expected."
end
list.mark_done_at(1)            # marks the 2nd item as done
begin
  list.mark_done_at(100)          # raises IndexError
rescue IndexError
  puts "Got IndexError as expected."
end

# mark_undone_at
begin
  list.mark_undone_at             # raises ArgumentError
rescue ArgumentError
  puts "Got ArgumentError as expected."
end
list.mark_undone_at(1)          # marks the 2nd item as not done,
begin
  list.mark_undone_at(100)        # raises IndexError
rescue IndexError
  puts "Got IndexError as expected."
end

# ---- Deleting from the the list -----

# shift
puts list.shift                      # removes and returns the first item in list

# pop
puts list.pop                        # removes and returns the last item in list

# remove_at
begin
  list.remove_at                  # raises ArgumentError
  list.remove_at(1)               # removes and returns the 2nd item
rescue ArgumentError
  puts "Got ArgumentError as expected."
end
puts list.todos
begin
  list.remove_at(100)             # raises IndexError
rescue IndexError
  puts "Got IndexError as expected."
end

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
puts list
puts "Found #{list.find_by_title("Clean room")}"
list.first.done!
puts list.all_done
puts list.all_not_done
=end
