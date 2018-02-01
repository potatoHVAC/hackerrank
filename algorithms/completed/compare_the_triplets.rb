#!/bin/ruby
#https://www.hackerrank.com/challenges/compare-the-triplets/problem
#solved 11/10/17

def solve(a,b)
    alice = 0
    bob = 0
    for i in 0...3
        if a[i] > b[i]
            alice += 1
        elsif a[i] < b[i]
            bob += 1
        end
    end
    return [alice,bob]
end

a = gets.strip.split(' ').map(&:to_i)

b = gets.strip.split(' ').map(&:to_i)

result = solve(a,b)
print result.join(" ")
