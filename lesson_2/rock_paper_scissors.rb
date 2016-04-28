VALID_CHOICES = %w(r p s l o).freeze

VALID_CHOICES_ACRONYM = {
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

def display_choice_message(hash_to_iterate)
  prompt("Please choose one:")
  hash_to_iterate.each do |k, v|
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
    display_choice_message(VALID_CHOICES_ACRONYM)
    player_choice = gets.chomp

    break if VALID_CHOICES_ACRONYM.key?(player_choice.downcase)
    prompt("That's not a valid choice.")
  end

  computer_choice = ''
  computer_choice = VALID_CHOICES_ACRONYM.keys.sample

  # Not my idea to add this. I got it from Pete's comments to others :)
  clear_screen

  prompt("You chose: #{VALID_CHOICES_ACRONYM[player_choice].capitalize}")
  prompt("Computer chose: #{VALID_CHOICES_ACRONYM[computer_choice].capitalize}")

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

prompt("Thank you for playing.")
