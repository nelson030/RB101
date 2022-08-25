#1
def repeat (s="",n=0)
  for i in 0...n
    puts s
  end
end

repeat('Hello', 3)

#2
def is_odd?(n)
  n%2==1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

#3
%{
def digit_list(n)
  n2 = []
  n1=n.to_s.chars
  n1.each {|x| n2.push(x.to_i)}
  return n2
end
}

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

#4
def count_occurrences(i)
  c_count = 0
  t_count = 0
  s_count = 0
  m_count = 0
  i.each {|x| 
    if x == "car"
      c_count += 1
    elsif x == "truck"
      t_count += 1
    elsif x == "SUV"
     s_count += 1
    elsif x == "motorcycle"
     m_count += 1
    else
   end
  }
  
  puts "car => #{c_count}"
  puts "truck => #{t_count}"
  puts "SUV => #{s_count}"
  puts "motorcycle => #{m_count}"
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

#5
def reverse_sentence(s)
  s.split(" ").reverse.join(" ")
end

puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

#6
p "number 6"
def reverse_words(w)
  w_arr=[]
  w.split(" ").each {|x|
    if x.size >= 5
      w_arr.push(x.reverse)
    else
      w_arr.push(x)
    end
  }
  return w_arr.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

#7
p "number 7"
def stringy(n)
  str=""
  n.times {|x|
    if x%2==0
      str += "1"
    else
      str += "0"
    end
    }
  return str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

#8
def average(a)
  (a.sum) / a.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

#9
def sum(n)
  n.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

#10
p "number 10"
def calculate_bonus(salary,bonus)
  if bonus
    return salary/2
  else
    return 0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000