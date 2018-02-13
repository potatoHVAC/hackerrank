#https://www.hackerrank.com/challenges/game-of-stones-1/problem
#completed Oct 2017

# Enter your code here. Read input from STDIN. Print output to STDOUT
num = gets.chomp.to_i

for i in 0...num
    x = gets.chomp.to_i
    if x%7 < 2
        puts "Second"
    else 
        puts "First"
    end
end


    
