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
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def check_neg(string)
  if string[0] == '-'
    true
  else
    false
  end
end

def string_to_signed_integer(true_or_false, string)
  string.delete! '-+'
  p string
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  if true_or_false
    value = value * (-1)
  else
  end
  value
end

p string_to_signed_integer(check_neg('4321'), '4321') == 4321
p string_to_signed_integer(check_neg('-570'), '-570') == -570
p string_to_signed_integer(check_neg('+100'), '+100') == 100
