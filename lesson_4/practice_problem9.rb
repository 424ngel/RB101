
#Practice problem #9

words = "the flintstones rock"

def title(str)
  arr = str.split
  arr = arr.map do |word|
    word.capitalize!
    word
  end
  p arr.join(" ")
end

title(words)
