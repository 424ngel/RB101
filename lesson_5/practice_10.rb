#Chapter 5, practice problem #10


testing = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.each do |k,v|
    new_hsh[k] = v+1
  end
 new_hsh
end


p testing