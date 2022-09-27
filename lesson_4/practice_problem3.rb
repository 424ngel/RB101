
#Practice problem #3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


ages.map do |key,value|
  if value >= 100
    ages.delete(key)
  end
  ages
end

p ages