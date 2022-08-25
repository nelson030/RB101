#1
=begin
def dms(num)
  num_f = num.to_f
  deg = (num_f.floor)
  num_dec = num_f - deg
  hour = (num_dec * 60)
  hour_dec = hour-hour.floor
  min = (hour_dec * 60).to_i
  p %(#{deg}°#{hour.floor}'#{min})
end
=end

=begin
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00")
p dms(360) == %(0°00'00")
=end

#2
=begin
VOWELS = %(a,e,i,o,u)

def remove_vowels(w)
  new_w=w.downcase.delete(VOWELS)
  p new_w
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

#3
=begin
def find_fibonacci_index_by_length(n)
  i_arr=[1,1]
  c=1
  i=0
  while i.digits.length<n
    i=i_arr[c]+i_arr[c-1]
    i_arr << i
    c+=1
  end
  p index=c+1
  return index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end

#4
=begin
def reverse!(arr)
  if arr
    for i in 0...arr.length
      arr[i] << arr[-i]
    end
  else
  end
  p arr
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
=end

s=["string", "string2"]
p s.length