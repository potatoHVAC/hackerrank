#https://www.hackerrank.com/challenges/ruby-blocks/problem
#completed Oct 2017

def factorial
    yield#_______________________
end

n = gets.to_i
factorial do
   fact = 1
   count = n
   while count >1
     fact*=count
     count-=1
   end
   puts fact
end
