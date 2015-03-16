puts "enter a string you want to check"
line=gets.chomp
pattern=/\s/
if line.match(pattern)
  puts "the string contains space characters"
else
  puts "the string does not contain space characters "
end
