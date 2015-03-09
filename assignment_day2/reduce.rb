
def reduce(line)
  array_of_characters=line.chars.to_a
  while array_of_characters.length!=1
   count=0
   reduced_line=''
    while count<array_of_characters.length
     reduced_line=reduced_line+array_of_characters[count]
     count=count+2
    end
   puts reduced_line
   array_of_characters=reduced_line.chars.to_a
   end
end


puts "Please enter a line"
line=gets.chomp
reduce(line)
