def two_sum?(arr, target_sum)
  arr.each_index do |idx|
    (idx+1...arr.length).each do |jdx|
      if arr[idx] + arr[jdx] == target
        return true
      end
    end
  end
end

# O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr.sort!

  until arr.length == 0 || arr.first > target_sum / 2
    target = (target_sum - arr.shift)
    return true if arr.bsearch {|el| target <=> el}
  end
  false
end


#O(n)
def two_sum_hash?(arr, target_sum)
  counter = Hash.new(false)

  arr.each do |el|
    return true if counter[target_sum - el]
    counter[el] = true
  end

  false

end
