require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done
    assert_equal(false, @list.done?)
  end

  def test_add
    assert_raises(TypeError) { @list.add('test') }
    assert_raises(TypeError) { @list << 'test' }
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(1000) }
    assert_equal(@todo1, @list.item_at(0))
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(1000) }
    @list.mark_done_at(0)
    assert_equal(true, @list.first.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(1000) }
    @list.mark_undone_at(0)
    assert_equal(false, @list.first.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def  test_remove_at
    todo4 = Todo.new("Test remove_at")
    @list << todo4
    assert_raises(IndexError) { @list.remove_at(1000) }
    @list.remove_at(3)
    assert_equal(3, @list.size)
  end

=begin
  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
=end
  
  def test_each
    count = 0
    rval = @list.each { count += 1 }
    assert_equal(3, count)
    assert_equal(@list, rval)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end
