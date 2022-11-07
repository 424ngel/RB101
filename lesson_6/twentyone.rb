
def text(str)
 puts ">> " + str
end

def space
  puts "\n"
end

def values(cards)
  sum = 0

  cards.each do |sub_arr|
    if sub_arr[1].to_i.to_s == sub_arr[1]
      sum+=sub_arr[1].to_i
    elsif sub_arr[1].to_i == 0 && sub_arr[1] != 'A'
      sum+=10
    end
  end

  cards.each do |sub_arr|
    if sub_arr[1] == 'A' && (sum + 11) <= 21
      sum += 11
    elsif sub_arr[1] == 'A' && (sum + 11) > 21
      sum+=1
    end
  end

  sum
end

def busted?(total)
  total > NUMBER
end

def display_win(p_total, d_total)
  if p_total <= NUMBER && p_total > d_total
    text 'You won this round!'
  elsif d_total <= NUMBER && d_total > p_total
    text 'Dealer won this round!'
  elsif busted?(p_total) && !busted?(d_total) 
    text 'Dealer won this round!'
  elsif busted?(d_total) && !busted?(p_total) 
    text 'You won this round!'
  elsif busted?(d_total) && busted?(p_total) 
    text 'Both of you BUSTED! :('
  elsif d_total == p_total
    text "It's a tie!"
  end
end

def player_won?(p_total, d_total)
  if p_total <= NUMBER && p_total > d_total
    true
  elsif d_total <= NUMBER && d_total > p_total
    false
  elsif busted?(p_total) && !busted?(d_total) 
    false
  elsif busted?(d_total) && !busted?(p_total) 
    true
  else
    'tie'
  end
end

def display_score(p_points, d_points)
  space
  puts "   +---------------------+   "
  puts "   | Player's points = #{p_points} |   "
  puts "   | Dealer's points = #{d_points} |   "
  puts "   +---------------------+   "
  space
end

CARDS = 
[
  ['H', '2'],['H', '3'],['H', '4'],['H', '5'],['H', '6'],['H', '7'],['H', '8'],['H', '9'],['H', '10'],['H', 'J'],['H', 'Q'],['H', 'K'],['H', 'A'],
  ['D', '2'],['D', '3'],['D', '4'],['D', '5'],['D', '6'],['D', '7'],['D', '8'],['D', '9'],['D', '10'],['D', 'J'],['D', 'Q'],['D', 'K'],['D', 'A'],
  ['C', '2'],['C', '3'],['C', '4'],['C', '5'],['C', '6'],['C', '7'],['C', '8'],['C', '9'],['C', '10'],['C', 'J'],['C', 'Q'],['C', 'K'],['C', 'A'],
  ['S', '2'],['S', '3'],['S', '4'],['S', '5'],['S', '6'],['S', '7'],['S', '8'],['S', '9'],['S', '10'],['S', 'J'],['S', 'Q'],['S', 'K'],['S', 'A'],
]

NUMBER = 21

text( "Welcome to TwentyOne!" )
space


player_points = 0
dealer_points = 0

loop do

player_cards = [CARDS.sample] + [CARDS.sample]
dealer_cards = [CARDS.sample] + [CARDS.sample]

player_total = values(player_cards)
dealer_total = values(dealer_cards)

text( "Your cards are -> #{player_cards}" )
text( "Dealer's cards -> [#{dealer_cards[0]}, [HIDDEN]]")
space

#PLAYER TURN
loop do
  text( "HIT or STAY?" )
  answer = gets.chomp.upcase
  
  break if answer == "STAY"

  player_cards += [CARDS.sample]
  player_total = values(player_cards)
  text( "Your cards are -> #{player_cards}" )
  space
  break if busted?(player_total)
end

#PLAYER BUSTED? / SCORE
if busted?(player_total)
  space
  text ( "You scored #{player_total}. BUSTED!" )
  space
else 
  space
  text ( "You scored #{player_total}." )
  space
end

#DEALER TURN
loop do
  break if busted?(dealer_total) || dealer_total == NUMBER 
  case dealer_total
  when 1..11
    then answer = ['HIT','HIT','HIT','STAY'].sample
  when 12..14
    then answer = ['HIT','HIT','STAY'].sample
  when 15..21
    then answer = ['HIT','STAY','STAY','STAY','STAY'].sample
  end

  if answer == 'STAY'
    break
  elsif answer == 'HIT'
    dealer_cards += [CARDS.sample]
    dealer_total = values(dealer_cards)
  end
end


text "Dealer's cards are -> #{dealer_cards}"

#DEALER BUSTED? / SCORE
if busted?(dealer_total)
  space
  text ( "Dealer scored #{dealer_total}. BUSTED!" )
  space
else 
  space
  text ( "Dealer scored #{dealer_total}." )
  space
end


#KEEPING SCORE
if player_won?(player_total, dealer_total)
  player_points += 1
elsif !player_won?(player_total, dealer_total)
  dealer_points += 1
else 
  player_points += 0
  dealer_points += 0
end



display_win(player_total, dealer_total)

display_score(player_points, dealer_points)




if player_points == 5 
  text "You reached 5 points!"
  text "You are the GRAND WINNER!"
  break
elsif dealer_points == 5
  text "Dealer reached 5 points!"
  text "Dealer is the GRAND WINNER!"
  break
end

text "Play Again?"
space 
puts "  ('Y' or 'N')"
response = gets.chomp.upcase

break if !response.start_with?('Y')
end