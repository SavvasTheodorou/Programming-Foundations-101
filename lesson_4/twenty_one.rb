require 'pry'

SUITS = ["Hearts", "Diamond", "Clubs", "Spades"]
CARDS = ["Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]
VALUE_10_CARDS = ["Jack", "Queen", "King"]
NEW_DECK = SUITS.product(CARDS)
used_deck = NEW_DECK

player_hand = NEW_DECK.sample(2)
minus_player_hand = NEW_DECK - player_hand
dealer_hand = minus_player_hand.sample(2)

def initialize_deck(player, dealer)
  used_deck = NEW_DECK - player - dealer
end

def prompt(message)
  puts "=> " + message
end

def card_value(cards)
  show_cards = []
  cards.each do |card|
    show_cards << card
  end
  show_cards
end

def display_card_value_only(cards)
  cards_value = []
  cards.each do |a|
    cards_value << a[1]
  end
  cards_value
end

def calculate_j_q_k_to_values(value)
  value.map! { |v| if v == "Jack" || v == "Queen" || v == "King" then v = 10 else v end }
end

puts "..........."

player_cards_in_integer = calculate_j_q_k_to_values(display_card_value_only(player_hand))
dealer_cards_in_integer = calculate_j_q_k_to_values(display_card_value_only(dealer_hand))

def calculate_total_value(cards)
  total = []
  total = cards.map{|a| if a == "Ace" then a = 11 else a end}
  total = total.inject(:+)
  if total > 22
    total = cards.map!{|a| if a == "Ace" then a = 1 else a end}
    total = total.inject(:+)
  end
  total
end

def busted(cards)
  total = calculate_total_value(calculate_j_q_k_to_values(display_card_value_only(cards)))
  if total > 21
    prompt "Busted"
  else
    total
  end
end

prompt "Welcome to Twenty One!"
prompt "Lets get to know each other. What's your name?"
name = gets.chomp

prompt "#{name} your hand is #{player_hand}."
prompt "You have #{display_card_value_only(player_hand)[0]} and #{display_card_value_only(player_hand)[1]}."
prompt "The total value of your cards is: #{calculate_total_value(player_cards_in_integer)}"
puts "..................................."
prompt "Dealer's hand is: #{dealer_hand[0]} and one unknown"

loop do
  prompt "Do you want to Hit(H) or Stay(S)?"
  answer = gets.chomp
  total = calculate_total_value(calculate_j_q_k_to_values(display_card_value_only(player_hand)))
  if answer.downcase == "s" || total > 21
    break
  else
    new_card = initialize_deck(player_hand, dealer_hand).sample(1).flatten!
    prompt "Your new cards is: #{new_card}"
    player_hand.push(new_card)
    player_hand
    display_card_value_only(player_hand)
    prompt "The total value of your cards is: #{calculate_total_value(calculate_j_q_k_to_values(display_card_value_only(player_hand)))}"
  end
end

prompt "You choose to stay."






