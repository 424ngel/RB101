#Chapter 5, practice problem #13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr.sort_by! do |sub_arr|
  sub_arr.select do |num|
    num%2==1
  end
end

p arr
