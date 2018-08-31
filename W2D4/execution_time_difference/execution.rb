# O(infinity?)
def my_min(list)

end

# O(n^2)
def largest_contiguous_subsum(list)
  subarrays = []
  list.length.times do |i|
    j = i
    until j == list.length
      subarrays << list[i..j]
      j += 1
    end

  end

  subarrays.max_by {|subarray| subarray.sum}.sum
end

def fast_subsum(list)

  i = 0
  curr_best_sum = 0
  best_end = 0
  until i == list.length
    if list[0..i].sum > curr_best_sum
      curr_best_sum = list[0..i].sum
      best_end = i
    end
    i += 1
  end

  best_end.times do |idx|
    if list[idx..best_end].sum > curr_best_sum
      curr_best_sum = list[idx..best_end].sum
    end
  end

  curr_best_sum
end
