VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(msg)
  puts ">> " + msg
end

def results(user, computer)
  if computer == user
  elsif (user == "rock") && DEFEATS_ROCK.include?(computer) ||
        (user == "paper") && DEFEATS_PAPER.include?(computer) ||
        (user == "scissors") && DEFEATS_SCISSORS.include?(computer) ||
        (user == "spock") && DEFEATS_SPOCK.include?(computer) ||
        (user == "lizard") && DEFEATS_LIZARD.include?(computer)  
    return false
  else
    return true
  end
end

def make_letter_choice(choice)
  case choice
  when "r" then "rock"
  when "p" then "paper"
  when "s" then "scissors"
  when "z" then "spock"
  when "l" then "lizard"
  end
end

def check_choice(choice)
  VALID_CHOICES.include?(choice)
end


DEFEATS_ROCK = ["paper", "spock"]
DEFEATS_PAPER = ["scissors", "lizard"]
DEFEATS_SCISSORS = ["rock", "spock"]
DEFEATS_SPOCK = ["paper", "lizard"]
DEFEATS_LIZARD = ["rock", "scissors"]

computer_score = 0
user_score = 0

prompt("First to score 3 is the grand winner!")

loop do

prompt("Choose:\n   rock ('R'), paper ('P'), spock ('Z'), scissors ('S'), lizard ('L')")
choice = ''

#Valid input check
loop do
choice = gets.chomp.downcase
choice = make_letter_choice(choice)
  if check_choice(choice)
    break
  else prompt("Not a valid choice!")
  end
end

prompt("You chose #{choice}")

computer_choice = VALID_CHOICES.sample
  
prompt("Computer chose #{computer_choice}")



#To display results & add to score
if results(choice,computer_choice) == false
  prompt("You lost!")
  computer_score += 1
  puts "\nUSER SCORE = #{user_score}\nCOMPUTER SCORE = #{computer_score}"
elsif results(choice, computer_choice) == true
  prompt("You win!")
  user_score += 1
  puts "\nUSER SCORE = #{user_score}\nCOMPUTER SCORE = #{computer_score}"
else
  prompt("It's a tie!")
end

#Check if either score is equal to 3
if user_score == 3
  prompt("You scored 3! You are the grand winner!")
  user_score = 0
  computer_score = 0
elsif computer_score == 3
  prompt("Game over :( Computer is the grand winner!")
  computer_score = 0
  user_score = 0
end

prompt("Play again? ('Y' or 'N')")
answer = gets.chomp.upcase
if answer.start_with?('Y')
  true
else break
end
end

prompt("Thank you for playing! :)")




