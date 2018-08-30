require "byebug"

def my_uniq(arr)
  raise(ArgumentError) unless arr.is_a?(Array)

  uniq_arr = []
  arr.each {|el| uniq_arr << el unless uniq_arr.include?(el)}
  uniq_arr
end

def two_sum_two(arr)
  raise(ArgumentError) unless arr.is_a?(Array)

  sum_zero_arr = []

  arr.length.times do |idx1|
    arr[idx1+1..-1].each_index do |idx2|
      if arr[idx1] + arr[idx1 + idx2 + 1] == 0
        sum_zero_arr << [idx1, idx1 + idx2 + 1]
      end
    end
  end

  sum_zero_arr

end

def my_transpose(arr)
  results = Array.new(arr[0].length){[]}
  # debugger
  arr.each_index do |row|
    arr[row].each_index do |col|
      results[col] << arr[row][col]
    end
  end

  results
end

def stock_picker(arr)
  raise(ArgumentError) unless arr.is_a?(Array)

  max_idxs = []
  max_value = 0
  arr[0...-1].each_with_index do |el,idx|
    sell_day = mvs(arr.drop(idx))
    if (arr[idx + sell_day] - arr[idx]) > max_value
      max_idxs = [idx, idx + sell_day]
    end
  end

  max_idxs

end


def towers_of_hanoi(discs = [[3, 2, 1], [], []])
  raise(ArgumentError) unless discs.count {|el| el.empty?} == 2

  until won?(discs)

    begin
      display(discs)

      puts "Which tower to take from?"
      from_tower = gets.chomp.to_i

      puts "Which tower to move to?"
      to_tower = gets.chomp.to_i

      move(discs, from_tower, to_tower)
      system("clear")
    rescue
      system("clear")
      puts "Git gud doofus!"
      retry
    end
  end
  puts "Winner Winner Chicken Dinner!"
end

def display(discs)
  discs.each {|el| p el}
end

def move(discs, from_tower, to_tower)
  raise "Invalid tower: Empty tower" if discs[from_tower].empty?
  unless discs[to_tower].empty?
    raise "Invalid tower move" unless discs[from_tower].last < discs[to_tower].last
  end
  discs[to_tower] << discs[from_tower].pop
  discs
end

def won?(discs)
  discs[0].empty? and discs.count{|el| el.empty?} == 2
end

private

def mvs(arr)
  return arr.find_index(arr[1..-1].max)
end

# towers_of_hanoi
