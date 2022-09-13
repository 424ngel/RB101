
def prompt(str)
  puts ">> " + str
end 

def loan_duration_to_months(months,years)
  if years > 0
    years = years * 12
  end
  years + months
end

prompt("Welcome to Mortgage Calculator")

loop do
  prompt("Please enter the loan amount :")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Not a valid number!")
    else
      break
    end
  end
  loan_amount = loan_amount.to_i

  prompt("Please enter the interest rate :")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt("Not a valid number!")
    else
      break
    end
  end

  interest_rate = interest_rate.to_f

  prompt("Please enter the loan duration in YEARS (if less than a year enter 0) :")
  loanduryears = ''
  loop do
    loanduryears = gets.chomp
    if loanduryears.empty? || loanduryears.to_i < 0
      prompt("Not a valid number!")
    else
      break
    end
  end
  loanduryears = loanduryears.to_i

  prompt("Please enter the loan duration in MONTHS :")
  loandurmonths = ''
  loop do
    loandurmonths = gets.chomp
    if loandurmonths.empty? || loandurmonths.to_i < 0
      prompt("Not a valid number!")
    else
      break
    end
  end
  loandurmonths = loandurmonths.to_i

  loanduration = loan_duration_to_months(loandurmonths,loanduryears)

  prompt("Calculating...")

  annual_interest_rate = interest_rate / 100
  monthly_rate = annual_interest_rate/12

  def calculation(loanamnt,monthlyrate,loandur)
    monthly_payment = loanamnt.to_f * (monthlyrate / (1 - (1 + monthlyrate)**(-loandur)))
    p monthly_payment
  end

  monthlypayment = calculation(loan_amount,monthly_rate,loanduration)

  prompt("Your monthly payment is #{monthlypayment}")

  prompt("Would you like to make another calcuation? ('Y' or 'N')?")
  answer = gets.chomp
  break unless answer.upcase.start_with?("Y")
end

prompt("Goodbye :)")
