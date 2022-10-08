#Lesson 5, practice problem #16


def uuid()
str = ""
chars = Array('a'..'z') + Array('1'..'9')
32.times do 
  str << chars.sample
end
str[7] += "-"
str[12] += "-"
str[17] += "-"
str[22] += "-"
puts str
end


# EXAMPLE :
# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

uuid()