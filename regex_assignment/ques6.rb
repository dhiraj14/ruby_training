puts "enter a string you want to check"
line=gets.chomp
pattern=/art$/
if line.match(pattern)
  puts "the string starts with art"
else
  puts "try again!!"
end
