#1
if false
  greeting = "hello world"
end

p greeting

#4
def is_ip_valid?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_nums = dot_separated_words.map do |word|
    word = word.to_i
  end
  if dot_separated_words.length < 4 || dot_separated_words.length > 4
    puts "Only fours number groups are make up a valid ip address. Invalid IP address."
    return false
  elsif dot_separated_nums.any? {|num| num < 0 || num > 255}
    puts "Numbers must not be less than 0 or greater than 255. Invalid IP address."
    return false
  else
    return true
  end
end

puts is_ip_valid?("125.125.125.125")
puts is_ip_valid?("125.125.125.1")
puts is_ip_valid?("125.125.125.1.2")
puts is_ip_valid?("125.125.125")
puts is_ip_valid?("125.125.125.1255")