class PolyTreeNode
  attr_accessor :children, :parent
  attr_reader :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)

    @parent.children.delete(self) unless @parent.nil?

    @parent = parent_node
    @parent.children << self unless @parent.nil?
  end

  def inspect
    "#{self.value}"
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Error" unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      return queue.first if queue.first.value == target_value
      queue += queue.first.children
      queue.shift
    end

    nil
  end

end
