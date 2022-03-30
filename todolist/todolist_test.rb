require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todolist'

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

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end
  
  def test_first
    assert_equal(@todos.first, @todo1)
  end

  def test_last
    assert_equal(@todos.last, @todo3)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    last = @list.pop
    assert_equal(@todo3, last)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_type_error
    assert_raises(TypeError){@list.add(2)}
    assert_raises(TypeError){@list.add('Hello')}
    assert_raises(TypeError){@list.add(Array.new)}
    assert_raises(TypeError){@list.add(Hash.new)}
  end

  def test_shovel_method
    @todo4 = Todo.new("new task")
    @list << @todo4
    assert_equal(@list.last, @todo4)
  end

  def test_add
    @todo5 = Todo.new("new task")
    @list.add(@todo5)
    assert_equal(@list.last, @todo5)
  end

  def test_item_at
    assert_equal(@list.item_at(2), @todo2)
    assert_raises(IndexError){@list.item_at(100)}
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_raises(IndexError){@list.mark_done_at(200)}
  end

  def test_mark_undone_at
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError){@list.mark_undone_at(10)}
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(10)}

    assert_equal([@todo2, @todo3], @list.remove_at(1).to_a)
    assert_equal([@todo1, @todo3], @list.remove_at(2).to_a)
    assert_equal([@todo1, @todo2], @list.remove_at(3).to_a)
  end

  def test_to_s
    test_string = <<~OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(test_string, @list.to_s)
  end

  def test_tos_single_item
    @todo1.done!

    test_string = <<~OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(test_string, @list.to_s)
  end

  def test_tos_all_items
    test_string = <<~OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.mark_all_done
    assert_equal(test_string, @list.to_s)
  end

  # def test_each_iteration
  #   iterated_list = @list.each(&:to_s)
  # end

  def test_each_return
    each_return = @list.each(&:puts)
    assert_equal(@list, each_return)
  end

  # def test_select
  #   select_return = @list.each(&:upcase)
  #   assert_equal(@list)
  # end
end