# Question 1

numbers = [1, 2, 2, 3]
p numbers.uniq

puts numbers

p numbers

puts

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")

puts advice

puts

# Question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers

puts

# Question 5
p (10..100).include?(42)

p (10..100).cover?(42)

puts

# Question 6
famous_words = "seven years ago..."
p famous_words.prepend("Four score and ")

famous_words = "seven years ago..."
p "Four score and #{famous_words}."

p "Four score and " << famous_words
