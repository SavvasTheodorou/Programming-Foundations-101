require 'securerandom'

# Question 2
greetings = { a: 'hi' }
#informal_greeting = greetings[:a]
informal_greeting = greetings[:a].clone

informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
p greetings # => {:a=>"hi"}

puts

# Question 3

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Question 4
def uuid_num
  p SecureRandom.uuid
end

uuid_num

def uuid
  characters = ("a".."f").to_a.concat((1..9).to_a)
  sequence = [8, 4, 4, 4, 12]

  clusters = sequence.map do |length|
    length.times.map { characters.sample }.join
  end
  clusters.join('-')
end

p uuid

puts

# Question 5
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_a_number?(word)
  end
  true
end
