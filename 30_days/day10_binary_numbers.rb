#!/bin/ruby
#https://www.hackerrank.com/challenges/30-binary-numbers/problem
#completed Oct 2017

n = gets.strip.to_i

def conver_binary(num)
  bin = ""
  while num != 0
    bin << (num%2).to_s
    num = num/2
  end
  return bin.reverse.to_i
end

def number_of_1(num)
  count = 0
  max = 0
  num.to_s.each_char do |x|
    if x == "1"
      count += 1
      if count > max
        max = count
      end
    else
      count = 0
    end
  end
  return max
end

p number_of_1(conver_binary(n))
