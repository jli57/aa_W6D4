require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      @store.each do |node|
        if node.key == key
          update_node!(node) 
          break
        end
      end 
    elsif @map.include?(key)
      @map.each do |map_key, map_value|
        if key == map_key
          calc!(key)
          break
        end 
      end 
    else
      @map.set(key, @prc.call(key))
      calc!(key) 
    end
    
    @store.last.val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    @store.remove(@store.first.key)
    @store.append(key, @map.get(key))
  end

  def update_node!(node)
    @store.remove(node.key)
    
    @store.append(node.key, node.val) 
  end

  def eject!
  end
end
