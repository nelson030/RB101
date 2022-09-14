#5
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param.push("rutabaga")
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#6
def color_valid(color)
  color == "blue" || color == "green"
end