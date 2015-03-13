
module List_and_search
  def list_products
    File.open("inventory.txt").readlines.each do |line|
      fields=line.split(",")
      puts "#{fields[0]}  #{fields[1]}  #{fields[2]} #{fields[3]} #{fields[4]}"
      end
  end

  def search_product
    puts "enter an id of the product you wanna search:"
    product_id=gets.chomp.to_i
    puts "product_id  name  company  price stock"
    File.open("inventory.txt").readlines.each do |line|
      fields=line.split(",")
        if product_id==fields[0].to_i
          puts "#{fields[0]}  #{fields[1]}  #{fields[2]} #{fields[3]} #{fields[4]}"
        end
    end
  end
end


class Product
  attr_accessor :name,:price,:stock_item,:company,:product_id
  
  def initialize(name,price,stock_item,company,product_id)
    @name=name
    @price=price
    @stock_item=stock_item
    @company=company
    @product_id=product_id
  end
  def to_s
    return @product_id+","+@name+","+@company+","+@price+","+@stock_item 
  end  
end


class Shopkeeper
  include List_and_search


  def add_product
    puts "enter the product_id:"
    product_id=gets.chomp
    puts "enter the product name:"
    name=gets.chomp
    puts "enter the product price:"
    price=gets.chomp
    puts "enter the product stock:"
    stock_item=gets.chomp
    puts "enter the product company name:"
    company_name=gets.chomp
    product=Product.new(name,price,stock_item,company_name,product_id)
    puts "product added"
    puts "the product is " + product.to_s
    f=File.open("inventory.txt","a+")
    f.puts product
    f.close
    
  end

 
  
  def remove_product
    puts "enter an id of the product you wanna delete:"
    product_id=gets.chomp
    File.open('temporary.txt', 'w') do |output_file|
      File.open('inventory.txt', 'r').each do |line|
        fields=line.split(",")
        if !(fields[0]==product_id)
          output_file.print line
        end 
      end
    end
    File.rename("temporary.txt","inventory.txt")
    
  end
  
  def edit_product
    puts "enter an id of the product you wanna edit:"
    product_id=gets.chomp
    File.open('temporary.txt', 'w') do |output_file|
      File.open('inventory.txt', 'r').each do |line|
        fields=line.split(",")
        if fields[0]==product_id
          puts "enter the product name:"
          name=gets.chomp
          puts "enter the product price:"
          price=gets.chomp
          puts "enter the product stock:"
          stock_item=gets
          puts "enter the product company name:"
          company_name=gets.chomp
          output_file.print product_id+","+name+","+company_name+","+price+","+stock_item
        else
          output_file.print line
        end 
      end
    end
    File.rename("temporary.txt","inventory.txt")
    
  end

end









class Customer
  include List_and_search

  def buy_products
    puts "buying a product"
    puts "Enter the product_id of the product you want to buy"
    product_id=gets.chomp
    File.open('temporary.txt', 'w') do |output_file|
      File.open('inventory.txt', 'r').each do |line|
        fields=line.split(",")
        if fields[0]==product_id
          if fields[4].to_i!= 0
            orders_file=File.open('orders.txt', 'a+')
            puts "Enter your name: "
            customer_name=gets.chomp
            puts "Enter your Credit Card number:"
            credit_card_number=gets.chomp
            puts "Enter your card's cvv"
            cvv=gets.chomp
            orders_file.print product_id+" "+customer_name+" "+credit_card_number+" "+cvv+"\n"
            orders_file.close
            stock_item=fields[4].to_i-1
            output_file.puts fields[0]+","+fields[1]+","+fields[2]+","+fields[3]+","+stock_item.to_s
          else
            puts "out of stock"
          end
        else
          output_file.puts line  
        end
      end  
    end  
    File.rename("temporary.txt","inventory.txt")
  end
end




user_choice=0
while user_choice!=3
  puts "you are a customer or a shopkeeper???"	
  puts "1.Customer"
  puts "2.Shopkeeper"
  puts "3.Exit"
  user_choice=gets.chomp.to_i
  case user_choice
    when 1
      puts "you are a customer"
      customer=Customer.new
      customer_choice=0
      while customer_choice!=4
        puts "enter your choice:"
        puts "1.List products\n2.Search product\n3.Buy products\n4.exit"
        customer_choice=gets.chomp.to_i
        case customer_choice
          when 1
            customer.list_products
          when 2
            customer.search_product
          when 3
            customer.buy_products
          when 4
            puts "Thank you"
          else
            puts "invalid choice,enter again"
        end
      end
    when 2
      puts "you are a Shopkeeper"
      shopkeeper=Shopkeeper.new
      shopkeeper_choice=0
      while shopkeeper_choice!=6
        puts "enter your choice:"
        puts "1.Add product\n2.List products\n3.Search product\n4.Remove product\n5.Edit product\n6.Exit"
        shopkeeper_choice=gets.chomp.to_i 
        case shopkeeper_choice
          when 1
            shopkeeper.add_product
          when 2
            shopkeeper.list_products
          when 3
            shopkeeper.search_product
          when 4
            shopkeeper.remove_product
          when 5
            shopkeeper.edit_product
          when 6
            puts "Thank you"
          else
            puts "enter valid choice"
        end
      end
    when 3
      puts "Thank you"
    else
      puts "enter valid choice"
    end
end

