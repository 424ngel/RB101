
#Practice problem #7

statement = "The Flintstones Rock"
counter = 0
hsh = {}

loop do 
  break if counter == statement.length
  #If the hash doesn't include the letter
  if hsh.keys.include?(statement[counter]) == false
    #hash[letter] => letter count
    hsh[statement[counter]] = statement.count(statement[counter])
  end

  counter += 1
end

p hsh

