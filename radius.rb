def calculate(radius)
	return 3.14*radius*radius
end

puts "Enter the radius :"
radius=gets.chomp.to_i

puts "Area is:"+calculate(radius).to_s
