#Chapter 5, practice problem #7

a = 2
b = [5, 8]
arr = [a, b]
# arr = [2,[5,8]]


arr[0] += 2
# arr = [4,[5,8]]
# a = 2
arr[1][0] -= a
# arr[1] --> [5,8][0] --> [5] = 5 - 2
# arr = [4,[3,8]]
# b = [3,8]
#The final output of a is 2 because a was not referenced at any point, only the array was referenced
# b was modified because it is an array, that was referenced at line 12, and its value was assigned to a new value

p arr
p a
p b
