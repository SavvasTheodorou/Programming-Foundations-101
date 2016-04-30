# Question 1
statement = "The Flintstones Rock!"
10.times {|num| puts "#{' ' * num}#{statement}"}

puts

# Question 2
statement = "The Flintstones Rock"
letters_array = []
letters_hash = {}
letters_array = statement.split(//)

letters_array.each do |key|
  letters_hash[key] = statement.scan(key).count
end

p letters_hash.keep_if {|k, v| k != " "}

puts

# Question 3
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

puts

# Question 4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  puts
  numbers.shift(1)
end

puts ".............."

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

puts

# Question 5
# def factors(number)
#   if number <= 0
#     puts "Please enter a valid number"
#   else
#     dividend = number
#     divisors = []
#     begin
#       divisors << number / dividend if number % dividend == 0
#       dividend -= 1
#     end until dividend == 0
#     p divisors
#   end
# end
# # p divisors = factors(-2)
# factors(-2)
divisors = []
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  p divisors
end
p divisors = factors(40)

puts

# Question 6
buffer = []
# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size >= max_buffer_size
#   buffer
# end
# p buffer
# input_array = []
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

p rolling_buffer2(buffer, 12, 6)
p buffer

puts

# Question 7
limit = 15

def fib(limit, first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(limit, 0, 1)
puts "result is #{result}"

puts

# Question 8

def titleize(str)
  str_array = []
  str.split(/ /).each do |word|
    str_array << word.capitalize
  end
  p str_array.join(' ')
end

titleize("If pattern is omitted, the value of $; is used.")

words = "If pattern is omitted, the value of $; is used."
p words.split.map { |word| word.capitalize }.join(' ')

puts

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
  

