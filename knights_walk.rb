def knight_tour(x_position,y_position)  
  if $moves==$max_moves
    print $solution
    puts "moves completed"
  else
    degree=degree(x_position,y_position)
    
    $moves+=1
    index=$moves
    $solution[x_position][y_position]=index
    knight_tour(x_position,y_position)  
 end
end


def degree(x_position,y_position)
  degree=0
  combination_no=0
  while  combination_no< 8
    x_new = x_position+$x_combinations[combination_no]
    y_new = y_position+$y_combinations[combination_no]
    if is_safe(x_new,y_new)
      degree+=1  
    end
  combination_no+=1
  end
  return degree	
end


def is_safe(x_new,y_new)
  if x_new>=$chess_length||x_new<0||y_new>=$chess_width||y_new<0||$solution[x_new][y_new]==-1
    return false
  else
    return true
  end
end



$x_combinations=[2,2,-2,-2,1,1,-1,-1]
$y_combinations=[1,-1,1,-1,2,-2,2,-2]
puts "enter the x_position"
x_position=gets.chomp.to_i
puts "enter the y_position"
y_position=gets.chomp.to_i
puts "enter the chess_length"
$chess_length=gets.chomp.to_i
puts "enter the chess_width"
$chess_width=gets.chomp.to_i	
$solution = Array.new($chess_length){Array.new($chess_width,-1)}
$moves=0
$max_moves=($chess_width)*($chess_length)

knight_tour(x_position,y_position)




=begin
  k = 0
  while k < 8
    x_new = x_position+$x_combinations[k]
    y_new = y_position+$y_combinations[k]
    if is_safe(x_new,y_new)
      puts degree(x_new,y_new)
    
    end
  k+=1
  end
=end

