#https://www.hackerrank.com/challenges/maximum-element/problem
#completed Oct 2017

int = gets.strip.to_i
stack = []
max = []

for i in 0...int
  query = gets.strip.split(' ').map(&:to_i)
  case query[0]
  when 1  
    stack << query[1]
    if max[0] == nil || query[1] >= max[-1]
      max << query[1]
    end
  when 2
    if stack[-1] == max[-1]
      max.pop(1)
    end
    stack.pop(1)
  else
    p max[-1]
  end
end

