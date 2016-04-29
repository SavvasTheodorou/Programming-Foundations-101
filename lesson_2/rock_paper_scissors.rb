VALID_CHOICES = %w(r p s l o).freeze

VALID_CHOICE_NAMES = {
  "r" => "rock",
  "p" => "paper",
  "s" => "scissors",
  "l" => "lizard",
  "o" => "spock"
}.freeze

WINNING_COMBINATIONS = {
  "r" => %(s l),
  "s" => %(p l),
  "p" => %(r o),
  "l" => %(o p),
  "o" => %(s r)
}.freeze

def prompt(message)
  puts "=> #{message}"
end

def display_choice_message(choice_hash)
  prompt("Please choose one:")
  choice_hash.each do |k, v|
    prompt("Choose '#{k}'' for #{v}")
  end
end

def win_calculation(player, computer)
  if WINNING_COMBINATIONS[player].include?(computer)
    "You won!"
  elsif player == computer
    "It's a tie!"
  else
    "Computer won!"
  end
end

prompt("Let's get to know each other. What's your name?")
player_name = ''
loop do
  player_name = gets.chomp.capitalize
  break unless player_name.empty?
  prompt("Make sure you use a valid name.")
end

prompt("Lets begin #{player_name}!")

# Not my idea to add this. I got it from Pete's comments to others :)
def clear_screen
  system('clear') || system('cls')
end

# When trying to add a method to add the winning turns I was not
# able to add the reault. It was always reseting to zero. Can you
# please explain why?

# def win_count(result)
#   if result == "You won!"
#     player_count += 1
#   elsif result == "Computer won!"
#     computer_count += 1
#   else
#     prompt("No point given")
#   end
#   prompt("Player has #{player_count} points.")
#   prompt("Computer has #{computer_count} points.")
# end

player_count = 0
computer_count = 0

# I tried with || "or" but it was looping until both reach 5
# Why?

while player_count < 5 && computer_count < 5
  player_choice = ''
  player_count = player_count
  computer_count = computer_count

  loop do
    display_choice_message(VALID_CHOICE_NAMES)
    player_choice = gets.chomp

    break if VALID_CHOICE_NAMES.key?(player_choice.downcase)
    prompt("That's not a valid choice.")
  end

  computer_choice = ''
  computer_choice = VALID_CHOICE_NAMES.keys.sample

  # Not my idea to add this. I got it from Pete's comments to others :)
  clear_screen

  prompt("You chose: #{VALID_CHOICE_NAMES[player_choice].capitalize}")
  prompt("Computer chose: #{VALID_CHOICE_NAMES[computer_choice].capitalize}")

  prompt(win_calculation(player_choice, computer_choice))

  # win_count(win_calculation(player_choice, computer_choice))

  if win_calculation(player_choice, computer_choice) == "You won!"
    player_count += 1
  elsif win_calculation(player_choice, computer_choice) == "Computer won!"
    computer_count += 1
  else
    prompt("No point given")
  end

  puts

  prompt("Player has #{player_count} points.")
  prompt("Computer has #{computer_count} points.")

  puts

end

if player_count == 5
  prompt("#{player_name} you reached 5 points and won")
else
  prompt("Good game #{player_name}. Computer won though,
   next time I'm sure you will win!")
end

prompt("Thank you for playing.")
