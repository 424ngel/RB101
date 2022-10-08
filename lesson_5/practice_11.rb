#Chapter 5, practice problem #11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

test_arr = arr.map do |sub_arr|
  new_arr = []
  sub_arr.select do |element|
    if element % 3 ==  0
      new_arr << element
    end
  end
  new_arr
end

p test_arr
