require 'pry'


a = 0

loop do 
  a += 1
  puts "Please pick 1 or 2"
  binding.pry
  case answer
  when 1
    puts "You chose 1"
  when 2
    puts "You chose 2"
  else
    puts "Invalid!"
    break
  end
end
