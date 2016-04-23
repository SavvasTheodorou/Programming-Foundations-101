# ask the user for two numbers
# ask the user for the type of operation to perform: add, subtract, multiply or divide
# perform the operation on the two numbers
# display the result


Kernel.puts("Welcome to calculator!")

Kernel.puts("What's your first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's your second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation do you want to perfomr? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == "1"
  result = number1.to_i() + number2.to_i()
elsif operator == "2"
  result = number1.to_i() - number2.to_i()
elsif operator == "3"
  result = number1.to_i() * number2.to_i()
elsif operator == "2"
  result = number1.to_f() - number2.to_f()
else
  Kernel.puts("I don't know the operator you used. Please choose 1, 2, 3 or 4")
end
  
Kernel.puts("The result is: #{result}.")