puts "enter a line containing Mrs"
line=gets.chomp
line=line.gsub(/\bMrs\b/,'Ms')
puts "the string after replacing the Mrs with Ms is:  #{line}"
