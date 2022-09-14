a = [[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
p a
# 1
# 3
# => [1, 3]

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
p my_arr # => [[18, 7], [3, 12]]

my_arr = [[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

p my_arr # => [[2, 4], [6, 8]]

my_arr = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

p my_arr # => [{ :c => "cat" }]

my_arr = [[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

p my_arr # => [[[2, 3], [4, 5]], [6, 7]]

puts "------------------------------------------------------------------------------------"
# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

arr = arr.map do |num|
  num.to_i
end

p arr.sort.reverse

#arr.sort do |a,b|
#  b.to_i <=> a.to_i
#end
# => ["11", "10", "9", "8", "7"]

puts "------------------------------------------------------------------------------------"
# How would you order this array of hashes based on the year of 
# publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort! do |a, b|
  a[:published] <=> b[:published]
end

# books.sort_by do |book|
#   book[:published]
# end

p books

puts "------------------------------------------------------------------------------------"
# For each of these collection objects demonstrate how 
# you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

puts "------------------------------------------------------------------------------------"
# For each of these collection objects where the value 3 occurs, 
# demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
p arr1[1][1]
arr1[1][1] = 4
p arr1[1][1]
#p arr1[2]
p " "

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
p arr2[2]
arr2[2] = 4
p arr2[2]
#p arr2[1][:d]
p " "

hsh1 = {first: [1, 2, [3]]}
p hsh1[:first][2][0]
hsh1[:first][2][0] = 4
p hsh1[:first][2][0]
p " "

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
p hsh2[['a']][:a][2]
hsh2[['a']][:a][2] = 4
p hsh2[['a']][:a][2]
#p hsh2[['a']][:b]
p " "

puts "------------------------------------------------------------------------------------"
# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0
munsters.each do |key, value|
  if value["gender"] == "male"
    age += value["age"]
  end
end
p age

puts "------------------------------------------------------------------------------------"

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}."
end

puts "------------------------------------------------------------------------------------"
# Using the each method, write some code to output all of 
# the vowels from the strings.

hsh = {first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']}
  
vowels = %(q w r t y p s d f g h j k l z x c v b n m)
output = ""
hsh.each do |key, value|
  value.each do |word|
    output << word.delete(vowels)
  end
end

p output

puts "------------------------------------------------------------------------------------"
# Given this data structure, return a new array of 
# the same structure but with the sub arrays being ordered 
# (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
p arr

puts "------------------------------------------------------------------------------------"
# Given the following data structure and without 
# modifying the original array, use the map method to 
# return a new array identical in structure to the 
# original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hsh|
  hsh.map do |key, value|
    value += 1
    hsh[key] = value
  end
  hsh.to_h
end
p new_arr

puts "------------------------------------------------------------------------------------"
# Given the following data structure use a combination of methods, 
# including either the select or reject method, to return a new 
# array identical in structure to the original but containing 
# only the integers that are multiples of 3.


arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select do |num|
    num % 3 == 0
  end
end
p new_arr

puts "------------------------------------------------------------------------------------"
# Given the following data structure, and without using 
# the Array#to_h method, write some code that will return a 
# hash where the key is the first item in each sub array 
# and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr_hash = arr.map do |sub_arr|
  new_hsh = {}
  new_hsh[sub_arr[0]] = sub_arr[1]
  new_hsh
end

puts arr_hash

puts "------------------------------------------------------------------------------------"
# Given the following data structure, return a new 
# array containing the same sub-arrays as the original 
# but ordered logically by only taking into consideration 
# the odd numbers they contain.

# expected: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
new_arr = arr.sort_by do |sub_arr|
  sub_arr.select do |number|
    number.odd?
  end
end

p new_arr

puts "------------------------------------------------------------------------------------"
# Given this data structure write some code to return an 
# array containing the colors of the fruits and the sizes 
# of the vegetables. The sizes should be uppercase and the 
# colors should be capitalized.

# Expected: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []
hsh.each do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map! { |word| word.capitalize }
    arr << value[:colors]
  else
    arr << value[:size].upcase
  end
end
p arr

puts "------------------------------------------------------------------------------------"
# Given this data structure write some code to return an array 
# which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
p new_arr
# => [{:e=>[8], :f=>[6, 10]}]

puts "------------------------------------------------------------------------------------"
UUID_CHARACTERS = %(1234567890abcdefghijklmnopqrstuvwxyz)
def create_uuid()
  limit = UUID_CHARACTERS.length
  sect1 = ""
  8.times do |i|
    sect1 << UUID_CHARACTERS[rand(0...limit)]
  end
  sect2 = ""
  4.times do |i|
    sect2 << UUID_CHARACTERS[rand(0...limit)]
  end
  sect3 = ""
  4.times do |i|
    sect3 << UUID_CHARACTERS[rand(0...limit)]
  end
  sect4 = ""
  4.times do |i|
    sect4 << UUID_CHARACTERS[rand(0...limit)]
  end
  sect5 = ""
  12.times do |i|
    sect5 << UUID_CHARACTERS[rand(0...limit)]
  end
  sect1+"-"+sect2+"-"+sect3+"-"+sect4+"-"+sect5
end

p create_uuid()

hsh = {}
a = [0, 1, 2]
a. each do |num|
  hsh[num] = "num #{num}"
end

p hsh.key?(3)