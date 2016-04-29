# Question 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts

# Question 2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.push("Dino")
flintstones << "Dino"
p flintstones

puts

# Question 3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push("Dino", "Hoppy")
# or flintstones.concat(%w(Dino Hoppy)) 

puts

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
# index_of_house = advice.index("house")
# end_sentence_index = advice.index(".")
# p advice.slice!(index_of_house..end_sentence_index)
p advice.slice!(0...advice.index('house'))

puts

# Question 5
statement = "The Flintstones Rock!"
lowercase_count = statement.scan("t").count
p lowercase_count

puts

# Question 6
title = "Flintstone Family Members"
p title.center(40)


