
#Practice problem #1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hsh = {}

flintstones.each_with_index do |element, i|
  hsh[element] = i 
end

p hsh