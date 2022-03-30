# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo) # alise for <<
    if todo.class == Todo
      @todos << todo
    else
      raise TypeError.new("Can only add Todo objects")
    end
    @todos
  end
  
  alias_method :<<, :add

  def size
    @todos.size
  end
  
  def first
    @todos[0]
  end
  
  def last
    @todos[-1]
  end
  
  def to_a
    @todos.to_a
  end
  
  def done?
   @todos.select{|todo| todo.done?}.size == @todos.size
  end
  
  def item_at(pos)
    if pos - 1 < @todos.size
      @todos[pos - 1]
    else 
      raise IndexError.new
    end
  end
  
  def mark_done_at(pos)
    if pos - 1 < @todos.size
      @todos[pos - 1].done!
    else 
      raise IndexError.new
    end
  end
  
  def mark_undone_at(pos)
    if pos - 1 < @todos.size
      @todos[pos - 1].undone!
    else 
      raise IndexError.new
    end
  end
  
  def done!
    @todos.map{|todo| todo.done!}
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(pos)
    if pos - 1 < @todos.size
      @todos - [@todos[pos - 1]]
    else
      raise IndexError.new
    end
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    counter = 0
    
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    
    self
  end
  
  def select
    selected_todos = TodoList.new(title)
    
    each do |todo|
      selected_todos << todo if yield(todo)
    end
    
    selected_todos
  end
  
  def find_by_title(str)
    select{|todo| todo.title == str}.first
  end
  
  def all_done
    select{|todo| todo.done?}
  end
  
  def all_not_done
    select{|todo| !todo.done?}
  end
  
  def mark_done(str)
    find_by_title(str).done! # possible solution has find_by_title(title) && find_by_title(title).done! instead WHY???
  end
  
  def mark_all_done
    each{|todo| todo.done!}
  end
  
  def mark_all_undone
    each{|todo| todo.undone!}
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")
