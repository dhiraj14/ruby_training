puts "enter the filename: "
filename=gets.chomp
pattern=/\w+/
File.open(filename).readlines.each do |line|
  line=line.scan(pattern)
  puts line[2]
end

