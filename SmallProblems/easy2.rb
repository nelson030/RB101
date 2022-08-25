#1
=begin
random_num = rand(180) + 20 # or rand(20..200)
puts "Teddy is #{random_num} years old!"
=end
#2
=begin
puts "Enter the length of the room in meters: "
length = gets.chomp.to_i
puts "Enter the width of the room in meters: "
width = gets.chomp.to_i
area_m = length*width.round(2)
area_m.to_f
area_ft = area_m*10.7639
puts "The area of the room is #{area_m} square meters (#{area_ft} square feet)."
=end
#3
=begin
puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f
tip = bill*(tip_percent/100)
total = tip + bill
puts "The tip is $#{tip}"
puts "The total is $#{total}"
=end
#4
=begin
puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
age_retire = gets.chomp.to_i
year = Time.now.year.to_i
years_left = age_retire - age
year_retire = year + years_left
puts "It's #{year}. You will retire in #{year_retire}. \nYou have only #{years_left} years of work to go!"
=end
#5
=begin
puts "What is your name?"
name = gets.chomp
if name.end_with?("!")
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end
=end
#6
=begin
num = (1..99).to_a
num.delete_if {|x| x.even?}
puts num
#7
num = (1..99).to_a
num.delete_if {|x| x.odd?}
puts num
=end
#8
num=0
choose=""

loop do
puts "Please enter an integer greater than 0: "
num=gets.chomp.to_i
break if num > 0
end

loop do
puts "Enter 's' to compute the sum, 'p' to compute the product."
choose = gets.chomp.to_s
break if choose == 's' || choose == 'p'
end

num_orig = num

if choose == 's'
  sum = 0
  loop do
    sum += num
    num -= 1
    break if num == 0
  end
  puts "The sum of the integers between 1 and #{num_orig} is #{sum}."
else
  product = 1
  loop do
    product *= num
    num -= 1
    break if num == 1
  end
  puts "The product of the integers between 1 and #{num_orig} is #{product}."
end