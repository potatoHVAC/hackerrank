#!/bin/ruby
#https://www.hackerrank.com/challenges/balanced-brackets/problem
#completed Oct 2017

def kill_char(arr, str)
  if (arr[-1] == '(' and str == ')') || (arr[-1] == '[' and str == ']') || (arr[-1] == '{' and str == '}')
    arr.pop(1)
    return arr
  end
  "NO"
end


def isBalanced(s)
  stack = []
  s.each_char do |x|
    if x == '(' or x == '[' or x == '{'
      stack << x
    else 
      if stack.length == 0
        return "NO"
      else
        stack = kill_char(stack, x)
        if stack == "NO"
          return "NO"
        end
      end
    end
  end
  if stack.length == 0
    return "YES"
  end
  "NO"
end

t = gets.strip.to_i
for a0 in (0..t-1)
  s = gets.strip
  result = isBalanced(s)
  puts result
end
