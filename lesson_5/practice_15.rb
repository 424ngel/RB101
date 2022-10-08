#Chapter 5, practice problem #15


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

a = arr.select do |hsh| 
  hsh.all? do |k,v|
    v.all? do |num|
      num.even?
    end
  end 
end

p a