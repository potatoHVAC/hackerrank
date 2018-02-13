#!/bin/ruby
#https://www.hackerrank.com/challenges/security-tutorial-functions/problem
#completed 11/27/17

def calculate(x)
    x%11
end

x = gets.strip.to_i
result = calculate(x)
puts result
