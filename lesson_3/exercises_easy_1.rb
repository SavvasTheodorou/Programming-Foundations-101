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


def add_eight(number)
  number + 8
end

puts

#  Question 7
number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

puts

# Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones

p flintstones.flatten!

puts

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")

puts

# Question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = { }
flintstones.each_with_index do |i, v|
  flintstones_hash[i] = v
end

p flintstones_hash
