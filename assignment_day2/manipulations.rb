def manipulate_string (line)
  puts "the given string #{line} after concatenating is:-  "+line.concat("abc")
  puts "the capitalized version of the string is :-  "+line.capitalize!
  puts "the string after removing the last few characters is is :-  "+line.chop
  puts "the inverting cases of string is :-  "+line.downcase!
  puts "the string after padding with * on both the end is :-  "+line.center(10+line.length,"*")
end

def manipulate_array (test_array)
  puts "the given array after adding 10 is:- #{test_array.push(10)}"
  puts "the array after inserting 50 at 6th position is :-  #{test_array.insert(4,50)}"
  puts "the most recent inserted element is :- #{test_array.pop} "
  puts "the array after removing the duplicates is :- #{test_array.uniq!} "
  puts "the array after removing nil is :- #{test_array.compact!}"
end


def manipulate_hash(test_hash)
  puts "inverted hash is"
  puts test_hash.invert
  hash2 = { "b" => 254, "c" => 300 }
  puts "the hash after merging the new hash is:"
  puts test_hash.merge(hash2)
  puts "the hash after shifting the "
  puts test_hash.shift 
end





#string manipulation
puts "Enter a string: "
string1=gets.chomp
manipulate_string(string1)

#array manipulation
puts "Enter the size of the array"
array_size = (gets.chomp.to_i - 1)
puts "enter the array elements"
test_array=Array.new(array_size)

for i in (0..array_size)
  test_array[i]=gets.chomp.to_i
end

puts test_array
manipulate_array(test_array)


#hash manipulation
test_hash = { "n" => 100, "m" => 100, "y" => 300, "d" => 200, "a" => 0 }
manipulate_hash(test_hash)

