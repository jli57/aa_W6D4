require "byebug"

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

class KnightPathFinder
  attr_reader :root_node
  attr_accessor :visited_positions
  def initialize(start)
    @root_node = PolyTreeNode.new(start)
    @visited_positions = [start]
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      next_children = new_move_positions(queue.first.value)
      next_children.each do |pos|
        new_child = PolyTreeNode.new(pos)
        new_child.parent = queue.first
        queue << new_child
      end

      queue.shift
    end
    self
  end

  def find_path(end_pos)
    build_move_tree

    bottom_node = @root_node.dfs(end_pos)

    trace_back_path(bottom_node)

  end

  def trace_back_path(node)
    path_array = [node.value]
    until node.parent.nil?
      path_array.unshift(node.parent.value)

      node = node.parent
    end
    path_array
  end

  def self.valid_moves(pos)
    moves = []
    row = pos.first
    col = pos.last
    if row >= 2 && col >= 1
      moves << [row - 2, col - 1]
    end
    if row >= 2 && col <= 6
      moves << [row - 2, col + 1]
    end
    if row >= 1 && col <= 5
      moves << [row - 1, col + 2]
    end
    if row <= 6 && col <= 5
      moves << [row + 1, col + 2]
    end
    if row <= 5 && col <= 6
      moves << [row + 2, col + 1]
    end
    if row <= 5 && col >= 1
      moves << [row + 2, col - 1]
    end
    if row <= 6 && col >= 2
      moves << [row + 1, col - 2]
    end
    if row >= 1 && col >= 2
      moves << [row - 1, col - 2]
    end

    moves
  end

  def new_move_positions(pos)
    next_positions = self.class.valid_moves(pos).reject do |move|
       @visited_positions.include?(move)
    end

    @visited_positions += next_positions
    next_positions
  end

  def inspect
    "pos: #{@root_node.value} children: #{@root_node.children}"
  end
end

k = KnightPathFinder.new([0,0])
p k.find_path([6,2])
