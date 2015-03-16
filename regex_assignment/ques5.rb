puts "enter a string you want to check"
line=gets.chomp
pattern=/\bSt/
if line.match(pattern)
  puts "the string starts with St"
end
