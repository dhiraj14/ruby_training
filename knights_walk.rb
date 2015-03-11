
def knight_tour(x_position,y_position)  
  combination_no,deg,index_x,index_y=0,0,x_position,y_position
  if $moves==($chess_width)*($chess_length)
    if $solution.include?(-1) 
      puts "solution does not exist"
      return
    else
      print_solution
      puts "moves completed"
    end
  else
    minimum=8
    while combination_no<8
    
      x_new = x_position+$x_combinations[combination_no]
      y_new = y_position+$y_combinations[combination_no]
      if check(x_new,y_new)==true
        deg=degree(x_new,y_new)
        if deg<minimum
          minimum=deg
          index_x,index_y=x_new,y_new
        end
      end
      combination_no+=1
    end 
    $moves=$moves+1
    $solution[index_x][index_y]=$moves
    
    knight_tour(index_x,index_y)  
  end
end


def degree(x_position,y_position)
  degree=0
  combination_no=0
  while  combination_no< 8
    x_new = x_position+$x_combinations[combination_no]
    y_new = y_position+$y_combinations[combination_no]
    if check(x_new,y_new)
      degree+=1  
    end
    combination_no+=1
  end
  return degree	
end


def check(x_new,y_new)
  if x_new<$chess_length&&x_new>=0&&y_new<$chess_width&&y_new>=0&&$solution[x_new][y_new]==-1
    return true
  else
    return false
  end
end

def print_solution
 for x in 0..$chess_length-1
   for y in 0..$chess_width-1
     print $solution[x][y]
     print "\t"
   end
 print "\n"
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
$moves=1
$solution[x_position][y_position] =1
knight_tour(x_position,y_position)






