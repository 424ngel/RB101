# The start of Practice problems: Sorting, Nested Collections & Working with Blocks
#Lesson 5, Practice problem 1

arr = ['10', '11', '9', '7', '8']


arr.sort! do |a,b|
  b.to_i <=> a.to_i
end

p arr


