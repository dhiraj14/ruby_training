word="Mississippi"
pattern=/ss/
if word.scan(pattern)
  puts "ss exists in mississippi"
else
  puts "ss doesnt exist in mississippi"
end

