WINNING_LINES =   [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + #rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + #cols
                  [[1, 5, 9], [3, 5, 7]]              #diag

def text(str)
  puts ">> " + str
end

def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def empty_spaces(brd)
  brd.keys.select { |num| brd[num] == " " }
end

def empty_board?(brd)
  empty_spaces(brd).empty?
end

def valid_number?(num)
  num.to_i.to_s == num && (1..9).include?(num.to_i)
end

def player_move(brd)
  num = " "

  loop do 
    text("Choose where to mark the board (#{joinor(empty_spaces(brd))}):")
    num = gets.chomp
    break if valid_number?(num) && empty_spaces(brd).include?(num.to_i)

    text("Not a valid number or space is full")
  end
  
  brd[num.to_i] = PLAYER_SYMBOL
end

def smart_move(brd, symbol)
  moves = []
  numbers = empty_spaces(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == symbol && brd[line[1]] == symbol
      moves << line[2] if numbers.include?(line[2])
    elsif brd[line[0]] == symbol && brd[line[2]] == symbol
      moves << line[1] if numbers.include?(line[1]) 
    elsif brd[line[1]] == symbol && brd[line[2]] == symbol
      moves << line[0] if numbers.include?(line[0]) 
    end
  end
  moves
end


def computer_move(brd)
  available_spaces = empty_spaces(brd)

  defense = smart_move(brd, PLAYER_SYMBOL)
  win_move = smart_move(brd, COMPUTER_SYMBOL)
 
  if defense.empty? && win_move.empty?
    choice = available_spaces.sample
  elsif win_move.empty? 
    choice = defense.flatten.sample
  else
    choice = win_move.flatten.sample
  end

  brd[choice] = COMPUTER_SYMBOL
end

def win?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_SYMBOL && 
       brd[line[1]] == PLAYER_SYMBOL && 
       brd[line[2]] == PLAYER_SYMBOL
       return 'Player'
    elsif 
       brd[line[0]] == COMPUTER_SYMBOL && 
       brd[line[1]] == COMPUTER_SYMBOL && 
       brd[line[2]] == COMPUTER_SYMBOL
       return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end


text("Would you like to play as 'X' or 'O'?")


loop do 
  PLAYER_SYMBOL = gets.chomp.upcase
  break if PLAYER_SYMBOL == 'X' || PLAYER_SYMBOL == 'O'
  text("Not a valid marker. Please choose 'X' or 'O'")
end


if PLAYER_SYMBOL == 'X'
  COMPUTER_SYMBOL = 'O'
else
  COMPUTER_SYMBOL = 'X'
end

computer_score = 0
player_score = 0

loop do
text("You are #{PLAYER_SYMBOL}")
text("Computer is #{COMPUTER_SYMBOL}")



board = initialize_board

display_board(board)

loop do
  player_move(board)

  display_board(board)

  break if win?(board) || empty_board?(board)

  computer_move(board)

  display_board(board)

  break if win?(board) || empty_board?(board)
end

if win?(board)
  text("#{detect_winner(board)} won!")
else
  text("It's a tie!")
end



if detect_winner(board) == 'Player'
  player_score += 1
  text("Player Score = #{player_score}")
  text("Computer Score = #{computer_score}")
elsif detect_winner(board) == 'Computer'
  computer_score += 1
   text("Player Score = #{player_score}")
  text("Computer Score = #{computer_score}")
end

if player_score == 5
  puts "\n>> Player scored 5! You won the game!"
  break
elsif computer_score == 5
  puts "\n>> Computer scored 5! Computer won the game!"
  break
end


text("Keep playing? ('Y' or 'N')?")
answer = gets.chomp.upcase


break unless answer.start_with?('Y')
end

text("Thanks for playing :)")