#!/bin/ruby
#https://www.hackerrank.com/challenges/30-recursion/problem
#completed Oct 2017

def factorial(n)
    if n == 1
        return 1
    else
        return n * factorial(n-1)
    end
end

n = gets.strip.to_i
result = factorial(n)
puts result
