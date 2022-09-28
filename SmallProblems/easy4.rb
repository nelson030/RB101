#1
=begin
def short_long_short(s1,s2)
  l1=s1.length
  l2=s2.length
  if l1>l2
    return s2+s1+s2
  else
    return s1+s2+s1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=end

#2
=begin
def century(y)
  y_s=y.to_s
  last2 = [y_s.(length-1)]+[y_s.(length)]
  if y_s[y_s.length] == "00"
    
end
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
=end

#3
=begin
def leap_year?(y)
  if y%4==0
    if y%100==0 && y%400!=0
      return false
    else
    end
    return true
  else
    return false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
=end

#4
=begin
def leap_year?(y)
  if y>1752
    if y%4==0
      if y%100==0 && y%400!=0
        return false
      else
      end
      return true
    else
      return false
    end
  else
    if y%4==0
      return true
    else
      return false
    end
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
=end

#5
=begin
def multisum(num)
  sum=0
  num.times {|i|
  i+=1
  if i%3==0 || i%5==0
    sum+=i
  else
  end
  }
  return sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
=end

#6
=begin
def running_total(a)
  sum=0
  a_new=[] # or use array.map{}
  a.each { |num|
    sum+=num
    a_new << sum
  }
  return a_new
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
=end

#7

=begin
DIGITS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9"
}

def signed_integer_to_string(num)
  number_array = []
  num_str_arr = []
  num_str = ''
  div_array = [100000, 10000, 1000, 100, 10, 1]
  counter = 0
  if num < 0
    negative = true
    num = num * -1
  end
  loop do
    number_array << (num / div_array[counter])
    num = (num % div_array[counter])
    counter += 1
    break if counter == div_array.length
  end
  number_array.each do |number|
    num_str_arr << DIGITS[number]
  end
  has_non_zero_lead = false
  p num_str_arr
  num_str_arr.map do |char|
    has_non_zero_lead = true if char != '0' && has_non_zero_lead == false
    num_str << char if has_non_zero_lead
  end
  if negative == true
    num_str = '-' + num_str
  elsif num_str == ''
    num_str = '0'
  else
    num_str = '+' + num_str
  end
  num_str
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
=end

#5

def century(year)
  year = year.to_f
  cent = (year / 100).ceil
  cent = cent.to_s
  if cent.end_with?("11") || cent.end_with?("12") ||
     cent.end_with?("13") || cent.end_with?("4") ||
     cent.end_with?("5") || cent.end_with?("6") ||
     cent.end_with?("7") || cent.end_with?("8") ||
     cent.end_with?("9") || cent.end_with?("0")
    cent = cent << "th"
  elsif cent.end_with?("1") || cent.end_with?("01")
    cent = cent << "st"
  elsif cent.end_with?("2") || cent.end_with?("02")
    cent = cent << "nd"
  elsif cent.end_with?("3") || cent.end_with?("03")
    cent = cent << "rd"
  end
  cent
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
