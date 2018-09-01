require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket = bucket(key)
    bucket.include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    if bucket.include?(key)
      bucket.update(key, val)
    else
      
      if @count == num_buckets
        resize!
      end   
      bucket.append(key, val)
      @count += 1 
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket = bucket(key)
    if bucket.include?(key)
      
      bucket.remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end 
    end 
  end

  
  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set


  private
  
  def num_buckets
    @store.length
  end

  def resize!
    new_hashmap_size = num_buckets * 2
    new_buckets = Array.new(new_hashmap_size) { LinkedList.new }
    self.each do |key, val|
      new_buckets[ key.hash % (new_hashmap_size) ].append(key, val)
    end
    @store = new_buckets
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
