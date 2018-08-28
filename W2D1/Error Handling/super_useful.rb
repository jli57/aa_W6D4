# PHASE 2
def convert_to_int(str)
  begin
    is_numeric_str = str.chars.all? { |char| ("0".."9").to_a.include?(char) }
    raise ArgumentError.new "booyeah" unless is_numeric_str
    Integer(str)
  rescue ArgumentError => e
    puts "Give the right thing, something like that"
    puts "Error was: #{e.message}"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit)
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise StandardError.new "Coffee is ok i guess"
  else
    puts "Ew now fruit!"
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError => e
    puts e.message
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin 
      raise ArgumentError.new "really you don't know bffs name" unless name
      @name = name
      raise ArgumentError.new "you guys just met!" unless yrs_known >= 5
      @yrs_known = yrs_known
      raise ArgumentError.new "No mutual hobbies!" unless fav_pastime
      @fav_pastime = fav_pastime
    # rescue ArgumentError => e
    #   puts e.message
    end
    
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


