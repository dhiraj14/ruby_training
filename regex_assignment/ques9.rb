puts "enter a string you want to check"
line=gets.chomp
pattern=/[^A-Za-z0-9]/
puts "the string before replacement is:  #{line}" 
line=line.gsub(pattern,'-')
puts "the string after replacement is:  #{line}"
