def anagram?(str1, str2)
  first_anagram?(str1).include?(str2)
end

def first_anagram?(str)
  str_perms = str.chars.permutation.to_a

  str_perms.map! {|perm| perm.join("")}
end

def second_anagram?(str1, str2)
  check_string = str2.chars
  str1.each_char do |char|
    idx = check_string.find_index(char)
    check_string.delete_at(idx) if idx
  end

  check_string.length == 0
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  chars_hash = Hash.new(0)

  str1.each_char {|char| chars_hash[char] += 1}
  str2.each_char {|char| chars_hash[char] -= 1}

  chars_hash.values.all? {|val| val == 0}
end
