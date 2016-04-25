# Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

# You'll need three pieces of information:

# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
# From the above, you'll need to calculate the following two things:

# monthly interest rate
# loan duration in months
# You can then use the formula described here: http://www.mtgprofessor.com/formulas.htm

# Finally, don't forget to run your code through Rubocop.

# Hints:

# Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
# If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.
# Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.

loan_amount = ''
annual_percentage_rate = ''
loan_duration = ''
name = ''
monthly_percentage_rate = ''
monthly_payment_amount = ''
answer = ''

def prompt(message)
  puts "=> #{message}"
end

def find_loan_rate
  annual_percentage_rate = gets.chomp.to_f
  [annual_percentage_rate, annual_percentage_rate / 100 / 12] # this returns the two varibles/stores them and can be used in the loop - annual_percentage_rate, monthly_percentage_rate = get_loan_rate
end

def valid_number?(num)
  num.to_i > 0
end

def yes_or_no?(ans)
  ans == "y" || ans == "n"
end

prompt("Before we start, lets get to know each other. I am Zeus. What's your name?")
loop do
  name = gets.chomp.capitalize

  if name.empty?
    prompt("Please eneter a valid name.")
  else
    break
  end
end

prompt("Welcome to the car loan calculator #{name}")
loop do
  loop do
    prompt("How much is your total loan amount?")
    loan_amount = gets.chomp.to_f

    prompt("Big loan for a car ...") if loan_amount.to_i > 150000

    if valid_number?(loan_amount)
      break
    else
      prompt("Please enter a valid loan amount.")
    end
  end

  loop do
    prompt("#{name}, what's the Annual Percentage Rate of your loan?")
    annual_percentage_rate, monthly_percentage_rate = find_loan_rate

    if valid_number?(annual_percentage_rate)
      loop do
        prompt("#{name}, your Annual Percentage Rate is #{annual_percentage_rate}% which is #{monthly_percentage_rate.round(4) * 100}% per month.")
        prompt("Is this correct? If yes type 'Y'")
        correct_answer = gets.chomp.downcase

        break if correct_answer.start_with?('y')
        prompt("It's ok to make mistakes:) Enter the Annual Percentage Rate again.")
        annual_percentage_rate, monthly_percentage_rate = find_loan_rate
      end
      break
    else
      prompt("Please enter a valid number")
    end
  end

  loop do
    prompt("What's the loan duration in years?")
    loan_duration = gets.chomp.to_i * 12

    if valid_number?(loan_duration)
      break
    else
      prompt("Please enter a valid loan duration.")
    end
  end

  monthly_payment_amount = (loan_amount * monthly_percentage_rate * (1 + monthly_percentage_rate)**loan_duration) / ((1 + monthly_percentage_rate)**loan_duration - 1)

  prompt("#{name}, your monthly interest rate is #{monthly_percentage_rate.round(4) * 100}%")
  prompt("Loan duration in months: #{loan_duration}")
  prompt("The monthly payment is: €#{monthly_payment_amount.round(2)}")
  puts
  
  loop do
    prompt("Calculate again? Hit 'Y' to calculate again, 'N' to exit")
    answer = gets.chomp
    
    if yes_or_no?(answer)
      break
    else
      prompt("I only accept 'Y' and 'N'")
    end
  end
  break unless answer.downcase.start_with?("y")
end
