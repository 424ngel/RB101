
#Practice problem #6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |element|
  element[0,3]
end

p flintstones