class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end 
    
    unless include?(key)
      self[key] << key
      @count += 1
    end 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_buckets = @store 
    @store = Array.new(num_buckets*2) {Array.new}
    
    old_buckets.each do |bucket|
      bucket.each do |el|
        self[el] << el
      end
    end 
  end
end

#Ask about XOR 