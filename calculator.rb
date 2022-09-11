#Calculator Walk-through

#asks for two numbers
#asks for the type of operation to perform: add, subtract, multiply or divide
#displays the result

puts ">> Enter the first #"
number1 = gets.to_i
puts ">> Enter the second #"
number2 = gets.to_i
puts ">> What operation would you like to perform?\n 1.add  2.subtract  3.multiply  4.divide"
operator = gets.to_i

case operator
when 1
  x = number1 + number2
  puts ">> #{number1} + #{number2} = #{x}"
when 2
  x = number1 - number2
  puts ">> #{number1} - #{number2} = #{x}"
when 3
  x = number1 * number2
  puts ">> #{number1} * #{number2} = #{x}"
when 4
  x = number1 / number2
  puts ">> #{number1} / #{number2} = #{x}"
end


