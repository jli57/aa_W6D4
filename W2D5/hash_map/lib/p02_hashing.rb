class Fixnum
  # Fixnum#hash already implemented for you
end


class Array
  def hash
    hash_value = 0
    
    self.each_with_index do |item, idx|
      hash_value += item.hash * (idx + 1)
    end 
    
    hash_value
    
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_value = 0
    
    self.each do |k, v|
      hash_value += (k.hash * 2) + (v.hash * 5)
    end
    
    hash_value
  end
end



#ask about XOR in hashing functions

