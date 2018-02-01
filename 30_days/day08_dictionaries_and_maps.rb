#https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem
#completed Oct 2017

# Enter your code here. Read input from STDIN. Print output to STDOUT

index = gets.chomp.to_i

phoneBook = Hash.new

for i in 1..index
  add_name = gets.chomp.split(" ")
  phoneBook[add_name[0].to_sym] = add_name[1].to_i
end


while true
  input = gets
  if input == nil
      break
  end
  get_input = input.chomp.to_sym
  if phoneBook[get_input] == nil
      puts "Not found"
  else 
      puts "#{input.chomp}=#{phoneBook[get_input]}"
  end
end
