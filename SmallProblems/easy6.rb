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

#2

=begin
VOWELS = %(aeiouAEIOU)

def remove_vowels(str)
  new_arr = []
  str.each do |phrase|
    no_vowel_phrase = phrase.delete(VOWELS)
    new_arr << no_vowel_phrase
  end
  new_arr
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

#4

=begin
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
=end

#5

=begin
def reverse(arr)
  new_arr = []
  return new_arr if arr.length == 0
  iteration = arr.length - 1
  loop do
    new_arr << arr[iteration]
    iteration -= 1
    break if iteration == -1
  end
  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
=end

#6

=begin
def merge(arr1, arr2)
  full_arr = arr1 + arr2
  no_duplicate_arr = []
  full_arr.each do |num|
    no_duplicate_arr << num unless no_duplicate_arr.include?(num)
  end
  no_duplicate_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
=end

#7

=begin
def halvsies(arr)
  arr1 = []
  arr2 = []
  half_way = (arr.length.to_f / 2.0).ceil
  iteration = 0
  arr.each do |num|
    if iteration < half_way
      arr1 << num
    else
      arr2 << num
    end
    iteration += 1
  end
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
=end

#8

=begin
def find_dup(arr)
  check_arr = []
  arr.each do |num|
    return num if check_arr.include?(num)
    check_arr << num
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
=end

#9

=begin
def include?(array, value)
  !!array.find_index(value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=end

#10

def triangle(num)
  i = 1
  loop do
    puts ("*" * i).rjust(num)
    i += 1
    break if i > num
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****
triangle(9)
