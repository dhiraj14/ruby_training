module Calculate
   def calculate_percentage(marks_scored,total_marks)
	(marks_scored/total_marks.to_f)*100
   end
   def calculate_interest(principal,rate_of_interest,period)
      puts (principal*rate_of_interest*period)/100
   end
end


class Score
   include Calculate
end


class Interest
   include Calculate
end



puts "marks scored"
marks_scored = gets.chomp.to_i
puts "total_marks"
total_marks = gets.chomp.to_i
student_no_1 = Score.new
puts "the percentage is"
puts student_no_1.calculate_percentage(marks_scored, total_marks)
puts "principal"
principal = gets.chomp.to_i
puts "rate_of_interest"
rate_of_interest = gets.chomp.to_i
puts "period"
period = gets.chomp.to_i
employee = Interest.new
puts "the simple interest is:"
employee.calculate_interest(principal,rate_of_interest,period) 
