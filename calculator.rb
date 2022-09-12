#Calculator Walk-through

#asks for two numbers
#asks for the type of operation to perform: add, subtract, multiply or divide
#displays the result
def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

puts ">> Welcome to Calculator! Enter your name:"
name = ''
loop do
  name = gets.chomp
  if name.empty?
    puts ">> Not a valid name"
  else
    break
  end
end

puts "Hello, #{name}"

loop do

  number1 = ''
  loop do
    puts ">> Enter the first #"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      puts ">> This is not a valid number"
    end
  end

  number2 = ''
  loop do
    puts ">> Enter the second #"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      puts ">> This is not a valid number"
    end
  end


  puts ">> What operation would you like to perform?\n 1.add  2.subtract  3.multiply  4.divide"
  operator = ''

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      puts ">> Must choose 1,2,3,4!"
    end
  end

  puts ">> #{operation_to_message(operator)} the two numbers..."
  operator = operator.to_i
  number1 = number1.to_i
  number2 = number2.to_i

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

  puts ">> Do you want to perform another calculation?\n ('Y' or 'N')"
  answer = gets.chomp.upcase

  break unless answer.start_with?('Y')
end

puts ">> Goodbye!"
