# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")
p ages.has_key?("Spot")
p ages.key?("Spot")
p ages.member?("Spot")

puts

# Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_ages = 0
ages.each do |k, v|
  total_ages = total_ages + v
end
p total_ages

p ages.values.inject(:+)
# This uses ages.values to make an array, then uses the inject method which is part of the 
# Enumerable module which is included in Array -- it is wise to augment your knowledge of what 
# you can do with arrays by studying Enumerable.

# The strange-looking parameter to inject is simply a variety of the inject method which says 
# "apply the + operator to the accumulator and object parameters of inject".

puts

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.each_value {|v| puts v if v > 100 }

puts

# Question 4
munsters_description = "The Munsters are creepy in a good way."

p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

puts

# Question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

puts

# Question 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

puts

# Question 7
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match("Dino")

puts

# Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index {|name| name.match("Be") }
p flintstones.index { |name| name[0, 2] == "Be" }

puts

# Question 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! {|name| name[0,3]}

puts

# Question 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map! {|name| name[0,3]}

