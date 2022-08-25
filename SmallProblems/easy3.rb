#1
=begin
puts "Enter the 1st number: "
num1=gets.chomp.to_i
puts "Enter the 2nd number: "
num2=gets.chomp.to_i
puts "Enter the 3rd number: "
num3=gets.chomp.to_i
puts "Enter the 4th number: "
num4=gets.chomp.to_i
puts "Enter the 5th number: "
num5=gets.chomp.to_i
puts "Enter the last number: "
num6=gets.chomp.to_i
arr = [num1, num2, num3, num4, num5]

if arr.include?(num6)
  puts "The number #{num6} appears in #{arr}."
else
  puts "The number #{num6} does not appear in #{arr}."
end
=end

#2
=begin
puts "Enter the first number: "
num1 = gets.chomp.to_i
puts "Enter the second number: "
num2 = gets.chomp.to_i

addition = num1 + num2
subtraction = num1 - num2
product = quotient = num1 * num2
quotient = num1 / num2
remainder = num1 % num2
power = num1 ** num2

puts "#{num1} + #{num2} = #{addition}"
puts "#{num1} - #{num2} = #{subtraction}"
puts "#{num1} * #{num2} = #{product}"
puts "#{num1} / #{num2} = #{quotient}"
puts "#{num1} % #{num2} = #{remainder}"
puts "#{num1} ** #{num2} = #{power}"
=end

#3
=begin
puts "Please write word or multiple words: "
words = gets.chomp
num = words.delete(" ").length
puts "There are #{num} characters in: #{words}"
=end

#4 and 5
=begin
def multiply(num1,num2)
  num1*num2
end

def square(num)
  multiply(num,num)
end

p multiply(5, 3) == 15
p square(5) == 25
p square(-8) == 64
=end

#6
=begin
def xor?(b1,b2)
  (b1==true && b2==false) || (b1==false && b2==true)
end

p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)
=end

#7
=begin
def oddities(arr)
  odd_elem = []
  i = 0
  while i < arr.size
    odd_elem << arr[i]
    i += 2
  end
  odd_elem
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
=end

#8
=begin
def palindrome?(word)
  word == word.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
=end

#9
=begin
def real_palindrome?(word)
  word.downcase.delete("^a-z0-9") == word.downcase.delete("^a-z0-9").reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
=end

#10
def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true