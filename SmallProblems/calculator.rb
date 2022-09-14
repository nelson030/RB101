
# Calculator

#ask user for 2 numbers
#ask user for an operation to perform
#perform the operation
#output result

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num != 0
end

def operation_to_msg(op)
  case op
  when 1
    'Adding'
  when 2
    'Subtracting'
  when 3
    'Multiplying'
  when 4
    'Dividing'
  end
end

prompt('Welcome to the calculator! Enter your name: ')

n = ''
loop do
  n = gets.chomp
  if n.empty?
    prompt('Make sure to use a valid name')
  else
    break
  end
end

prompt("Hi #{n}")

loop do
  num1 = ''
  loop do
    prompt('Input number 1: ')
    num1 = gets.chomp.to_f
    break if valid_number?(num1)
    prompt('That is not a valid number. Try again.')
  end
  prompt('Input number 2: ')
  num2 = gets.chomp.to_f
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  c = ''
  a = [1, 2, 3, 4]
  loop do
    c = gets.chomp.to_i
    break if a.include?(c)
    prompt('Must choose 1, 2, 3, or 4.')
  end
  prompt("#{operation_to_msg(c)} the two numbers...")
  
  case c
  when 1
    result = num1 + num2
  when 2
    result = num1 - num2
  when 3
    result = num1 * num2
  when 4
    result = num1 / num2
  end
  prompt("The result is #{result}")
  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for using the calculator! Bye!')