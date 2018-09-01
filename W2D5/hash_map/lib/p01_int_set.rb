class MaxIntSet
  def initialize(max)
    @max = max 
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true 
  end
  
  def remove(num)
    is_valid?(num)
    @store[num] = false
  end
  
  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise("Out of bounds") unless num >= 0 && num < @max 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def include?(num)
    self[num].include?(num)
  end
  
  def insert(num)
    self[num] << num unless include?(num)
  end
  
  def remove(num)
    self[num].delete(num) if include?(num)
  end
  
  private

  def [](num)
    @store[num % 20]
  end 

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @num_el = 0 
    @num_buckets = num_buckets
    @store = Array.new(@num_buckets) { Array.new }
  end

  def include?(el)
    self[el].include?(el)
  end
  
  def insert(el)
    if @num_el == @num_buckets
      resize!
    end
    
    unless include?(el)
      self[el] << el 
      @num_el += 1
    end 
  end
  
  def remove(el)
    if include?(el)
      self[el].delete(el) 
      @num_el -= 1
    end
  end

  def count
    @num_el
  end 
  
  private
  
  def [](el)
    @store[el % @num_buckets]
  end 

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    new_buckets = Array.new(@num_buckets) {Array.new}
    
    @store.each do |bucket|
      bucket.each do |el|
        new_buckets[el % @num_buckets] << el
      end
    end 
    
    @store = new_buckets
  end 
end



