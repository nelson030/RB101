=begin
str = 'The grass is green'
p str[4, 5] # or str.slice(4, 5)

p country_capitals = { uk: 'London', france: 'Paris', germany: 'Berlin' }
p country_capitals.keys      # => [:uk, :france, :germany]
p country_capitals.values    # => ["London", "Paris", "Berlin"]
p country_capitals.values[0] # => "London"

p arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']].to_h
# => { name: 'Joe', age: 10, favorite_color: 'blue'}

str = "joe's favorite color is blue"
# capitalize every first letter.
arr = str.split
arr = arr.map { |word| word.capitalize }
p str = arr.join(' ')

arr = [1, 2, 3, 4, 5]
arr.map! do |num|
  num += 1
end
p arr

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
p hsh

number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end

puts "-------------------------------------------------------------------------------------------"

def select_fruit(input)
  counter = 0
  new_hash = Hash.new
  key_array = input.keys
  
  loop do
    if input[key_array[counter]] == ('Fruit')
      puts "Fruit"
      new_hash[key_array[counter]] = input[key_array[counter]]
    end
    
    counter += 1
    break if counter == key_array.size
  end
  
  new_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

puts "-------------------------------------------------------------------------------------------"

def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    if counter.odd?
      numbers[counter] = current_number * 2
    end

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers(my_numbers) # => [1, 8, 3, 14, 2, 12]
p my_numbers

puts "-------------------------------------------------------------------------------------------"

def multiply(num_array, multiplier)
  counter = 0
  new_array = []
  
  loop do
    new_number = num_array[counter] * multiplier
    new_array << new_number
    
    counter += 1
    break if counter == num_array.size
  end
  
  new_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are 
# the keys and the values are the positions in the array.

flintstones_hash = {}
flintstones.each_with_index do |value, i|
  flintstones_hash[value] = i
end

p flintstones_hash

puts "-------------------------------------------------------------------------------------------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
  "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Add up all of the ages from the Munster family hash:

ages_values = ages.values
sum = ages_values.sum
p sum

puts "-------------------------------------------------------------------------------------------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# remove people with age 100 and greater.

# ages.keep_if { |_, age| age < 100 }

young_people = {}
ages.map do |key, value|
  if value < 100
    young_people[key] = value
  end
end

p young_people

puts "-------------------------------------------------------------------------------------------"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
  "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Pick out the minimum age from our current Munster family hash:

p ages.values.min

puts "-------------------------------------------------------------------------------------------"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

first_Be = nil
flintstones.each_with_index do |name, i|
  if name.start_with?("Be")
    first_Be = i
    break
  else
    puts name
  end
end

puts first_Be

puts "-------------------------------------------------------------------------------------------"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Amend this array so that the names are 
# all shortened to just the first three characters:

shortened_flintstones = flintstones.map do |name|
  if name.length >= 3
    name = name[0] + name[1] + name[2]
  else
    name
  end
end

p shortened_flintstones

puts "-------------------------------------------------------------------------------------------"

statement = "The Flintstones Rock"
# Create a hash that expresses the frequency with 
# which each letter occurs in this string:

frequency = {}
chars_statement = statement.chars
chars_statement.delete(' ')
chars_statement.each do |letter|
  letter = letter.downcase
  if frequency[letter]
    frequency[letter] += 1
  else
    frequency[letter] = 1
  end
end

p frequency

puts "-------------------------------------------------------------------------------------------"

words = "the flintstones rock"

words = words.split.map do |word|
  word.capitalize
end

words = words.join(' ')
p words

puts "-------------------------------------------------------------------------------------------"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an 
# additional "age_group" key that has one of three values describing the 
# age group the family member is in (kid, adult, or senior). Your solution 
# should produce the hash below
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17,
# an adult is in the range 18 - 64 and 
# a senior is aged 65+.

=begin
munsters.each_with_index do |key, value|
  if munsters[key]["age"] >= 0 && munsters[key]["age"] <= 17
    add_hash = {"age_group" => "kid"}
    munsters[key].merge!(add_hash)
  elsif munsters[key]["age"] >= 18 && munsters[key]["age"] <= 64
    add_hash = {"age_group" => "kid"}
    munsters[key].merge!(add_hash)
  elsif munsters[key]["age"] >= 65
    add_hash = {"age_group" => "kid"}
    munsters[key].merge!(add_hash)
  else
  end
end
=end

munsters_keys = munsters.keys
#add_hash = {"age_group" => "adult"}

#p munsters[munsters_keys[0]].merge(add_hash)
counter = 0

loop do
  age = munsters[munsters_keys[counter]]["age"]
  current_key = munsters_keys[counter]
  if age >= 0 && age <= 17
    add_hash = {"age_group" => "kid"}
    munsters[current_key].merge!(add_hash)
  elsif age >= 18 && age <= 64
    add_hash = {"age_group" => "adult"}
    munsters[current_key].merge!(add_hash)
  elsif age >= 65
    add_hash = {"age_group" => "senior"}
    munsters[current_key].merge!(add_hash)
  else
  end
  counter += 1
  break if counter == munsters_keys.size
end

p munsters == { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  
puts "-------------------------------------------------------------------------------------------"

hash_test = [
  { a: "apple apple", b: "banana banana" },
  { a: "ape ape", b: "bear bear" }
]

p hash_test.reject { |k|
  k[:a] == "apple appl"
}