=begin

# Pseudo-code

# 1. a method that returns the sum of two integers

START

# given an input of 2 integers

SET int1 = the first integer
SET int2 = the second integer

SET sum = int1 + int2

PRINT sum

END

# 2. a method that takes an array of strings, 
and returns a string that is all those strings concatenated together

START

# given an input of an array of strings

SET str_arr = the input array

SET str = str_arr with the function that concatenates while adding a ' '

PRINT str

END

# 3. a method that takes an array of integers, 
and returns a new array with every other element 
from the original array, starting with the first element. 
For instance: everyOther([1,4,7,2,5]) # => [1,7,5]

START

# given an input of an array of integers

SET arr = input array
SET new_arr = empty array
SET i = 0

WHILE i < length of array
  IF iterator is even
    arr[i] << new_arr
  ELSE
  END
  i += 1

PRINT new_arr

END

# 4. a method that determines the index of the 
3rd occurrence of a given character in a string. 
For instance, if the given character is 'x' and the 
string is 'axbxcdxex', the method should return 6 
(the index of the 3rd 'x'). If the given character 
does not occur at least 3 times, return nil.

START

# given an input of a string

SET str = input string
SET i = 0
SET i2 = 0 iterater for letter input
READ input = given letter from user input

WHILE i < length of string
  SET char = str[i]
  IF char == input
    i2 += 1
    IF i2 == 3
      PRINT i
    ELSE
  ELSE
  
  i += 1

PRINT nil  

END

# 5. a method that takes two arrays of numbers 
and returns the result of merging the arrays. 
The elements of the first array should become 
the elements at the even indexes of the returned array, 
while the elements of the second array should become 
the elements at the odd indexes. For instance:
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

START

# given an input of 2 arrays of numbers

SET arr1 = first input array
SET arr2 = second input array
SET new_arr = empty array
SET i1 = 0 iteration for arr1
SET i2 = 0 iteration for arr1
SET i = 0 iteration for overall loop

WHILE i < length of arr1 + length of arr2
  IF i is even
    arr1[i1] << new_arr
    i1 += 1
  ELSE
    arr2[i2] << new_arr
    i2 += 1

PRINT new_arr

END

=end

name = "Lisa"

def display_name
  puts name
end

display_name