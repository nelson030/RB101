#3
# change 'important' to 'urgent'
advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!('important', 'urgent')
advice_split = advice.split
advice_split = advice_split.map.with_index do |word, i|
  if word == 'important'
    advice_split[i] = 'urgent'
  else
    advice_split[i] = word
  end
end

advice = advice_split.join(' ')

puts advice

#5
p (10..100).cover?(42)

#6
famous_words = "seven years ago..."
# way 1
added_phrase = "Four score and "
combined_phrase = added_phrase + famous_words
puts combined_phrase
#way 2
added_phrase << famous_words
puts added_phrase

#7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!
p flintstones

#8
flintstones = { "Fred" => 0, "Wilma" => 1, 
  "Barney" => 2, "Betty" => 3, 
  "BamBam" => 4, "Pebbles" => 5 }
  
#flintstones.assoc("Barney")
#=> ["Barney", 2]
p flintstones = ["Barney", flintstones["Barney"]]