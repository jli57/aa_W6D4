require 'byebug'

#O(n^2) 3 loops in 1 nested loop => n * 3n
def bad_window(arr, w)
  current_max_range = 0
  idx = 0

  until w + idx > arr.length
    window = arr[0 + idx...w + idx]
    new_range = window.max - window.min
    current_max_range = new_range if new_range > current_max_range

    idx += 1
  end

  current_max_range
end

class MyQueue

  attr_accessor :store
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  attr_accessor :store
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
attr_accessor :in_stack, :out_stack
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def peek
    @out_stack.peek
  end

  def size
    @out_stack.size
  end

  def empty?
    @out_stack.empty?
  end

  def enqueue(el)
    @in_stack.push(el)
  end

  def dequeue
    if @out_stack.empty?
      @in_stack.size.times do |i|
        @out_stack.push(@in_stack.pop)
      end
    end
    @out_stack.pop
  end
end

class MinMaxStack
  attr_accessor :store
  def initialize
    @store = []
    @max = 0
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max

  end

  def push(el)
    @store << el
    @max = el if el > max
  end

  def pop
    el = @store.pop

  end






end
