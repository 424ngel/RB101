
# This file was used to test lesson 3 practice problems.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length != 4
    return false
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?("4.5.5")
p dot_separated_ip_address?("4.4.4.5")

