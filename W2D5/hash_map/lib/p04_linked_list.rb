class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key 
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    
    #new_node previous is old last
    new_node.prev = last
    
    #new_node next is tail node
    new_node.next = @tail
    
    #old last next is new node
    last.next = new_node
    
    #tails previous is new node
    @tail.prev = new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key 
        node.val = val 
        break 
      end 
    end 
  end

  def remove(key)
    self.each do |node|
      if node.key == key 
        node.prev.next = node.next
        node.next.prev = node.prev
        node.next = nil
        node.prev = nil
        break
      end 
    end 
  end

  def each(&prc)
    current_node = first
    while current_node.next
      prc.call(current_node)
      current_node = current_node.next
    end
  end
  

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
