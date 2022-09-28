#1
=begin
def ascii_value(str)
  sum=0
  str.chars.map {|char| #or .each_char
    sum+=char.ord
  }
  return sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
=end

#2
=begin
def time_of_day(n)
  d=n/1440
  n-=(d*1440)
  hour = n/60
  minutes = (n%60)
  if hour<10 && minutes>9
   p time = "0#{hour}:#{minutes}"
  elsif hour<10 && minutes<10
    p time = "0#{hour}:0#{minutes}"
  elsif hour>9 && minutes<10
    p time = "#{hour}:0#{minutes}"
  else
    p time = "#{hour}:#{minutes}"
  end
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
=end

#3
=begin
def convert_to_minutes(time_str)
  h=(time_str[0]+time_str[1]).to_i
  m=(time_str[3]+time_str[4]).to_i
  minutes = (h*60) + m
  if minutes%1440==0
    return 0
  else
    return minutes
  end
end

def after_midnight(time_str)
  convert_to_minutes(time_str)
end

def before_midnight(time_str)
  t=convert_to_minutes(time_str)
  if t == 0
    return 0
  else
    return time_str=1440-t
  end
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
=end

#4
=begin
def swap(s)
  s_arr=[]
  s_arr = s.split(" ")
  s_arr.each{|word|
    word[0], word[-1] = word[-1], word[0]
  }
  s_arr.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

def swap_first_last_characters(a, b)
  a, b = b, a
end
word="ab"
swap_first_last_characters(word[0], word[-1])
=end

#5
=begin
LETTERS=("a".."z").to_a

def cleanup(s)
  del_arr=[]
  count=0
  s.each_char{|char|
    if LETTERS.include?(char)==false
      char.replace(" ")
    else
    end
    count+=1
  }
  p s
end

p cleanup("---what's my +*& line?") == ' what s my line '
=end

#6 and 7
=begin
LETTERS=("a".."z").to_a

def word_sizes(s)
  num_letters = Hash.new
  s_arr=s.split
  s_arr.map{|word|
    word.downcase!
    word.chars.map.with_index {|char,i|
      word[i]="" unless LETTERS.include?(char)
    }
    l=word.length
    if num_letters[l]
      num_letters[l]+=1
    else
      num_letters[l]=1
    end
  }
  return num_letters
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
=end

#8
=begin
def change_num_to_str(arr)
  str_ar=[]
  arr.each {|num|
    case num
    when 0
      str_ar << ("zero")
    when 1
      str_ar << ("one")
    when 2
      str_ar << ("two")
    when 3
      str_ar << ("three")
    when 4
      str_ar << ("four")
    when 5
      str_ar << ("five")
    when 6
      str_ar << ("six")
    when 7
      str_ar << ("seven")
    when 8
      str_ar << ("eight")
    when 9
      str_ar << ("nine")
    when 10
      str_ar << ("ten")
    when 11
      str_ar << ("eleven")
    when 12
      str_ar << ("twelve")
    when 13
      str_ar << ("thirteen")
    when 14
      str_ar << ("fourteen")
    when 15
      str_ar << ("fifteen")
    when 16
      str_ar << ("sixteen")
    when 17
      str_ar << ("seventeen")
    when 18
      str_ar << ("eighteen")
    when 19
      str_ar << ("nineteen")
    else
    end
  }
  return str_ar
end

def change_str_to_num(arr)
  num_ar=[]
  arr.each {|num|
    case num
    when ("zero")
      num_ar << 0
    when ("one")
      num_ar << 1
    when ("two")
      num_ar << 2
    when ("three")
      num_ar << 3
    when ("four")
      num_ar << 4
    when ("five")
      num_ar << 5
    when ("six")
      num_ar << 6
    when ("seven")
      num_ar << 7
    when ("eight")
      num_ar << 8
    when ("nine")
      num_ar << 9
    when ("ten")
      num_ar << 10
    when ("eleven")
      num_ar << 11
    when ("twelve")
      num_ar << 12
    when ("thirteen")
      num_ar << 13
    when ("fourteen")
      num_ar << 14
    when ("fifteen")
      num_ar << 15
    when ("sixteen")
      num_ar << 16
    when ("seventeen")
      num_ar << 17
    when ("eighteen")
      num_ar << 18
    when ("nineteen")
      num_ar << 19
    else
    end
  }
  return num_ar
end

def alphabetic_number_sort(num_arr)
  str_arr=change_num_to_str(num_arr)
  s = str_arr.sort
  num_arr=change_str_to_num(s)
  return num_arr
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

#9
=begin
def crunch(str)
  l=str.length
  new_str=""
  for i in 0...l
    if new_str.end_with?(str[i])
    else
      new_str << str[i]
    end
  end
  p new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
=end

#10
=begin
def print_in_box(str)
  l=str.length
  t_b_dash = "-"*l
  mid_space= " "*l
  puts "+-#{t_b_dash}-+"
  puts "| #{mid_space} |"
  puts "| #{str} |"
  puts "| #{mid_space} |"
  puts "+-#{t_b_dash}-+"
  puts ""
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('')
=end

#11
=begin
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"
=end

#5

LETTERS = %(abcdefghijklmnopqrstuvwxyz).split("")

def cleanup(sentence)
  arr = sentence.split("")
  clean_arr = []
  arr.map do |char|
    if LETTERS.include?(char)
      clean_arr << char
    else
      clean_arr << " " unless clean_arr.last == ' '
    end
  end
  clean_arr.join("")
end

p cleanup("---what's my +*& line?") == ' what s my line '
