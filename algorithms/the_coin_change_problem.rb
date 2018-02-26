#!/bin/ruby
# https://www.hackerrank.com/challenges/coin-change/problem
# completed 2/20/18

def get_ways(coins, target)
  target_hit = Array.new(target + 1, 0)

  coins.each do |coin|
    for i in coin..target
      if i == coin
        target_hit[i] += 1
      else
        target_hit[i] += target_hit[i - coin]
      end
    end
  end

  target_hit.last
end

def hackerrank
  target, number = gets.strip.split(' ').map(&:to_i)
  coins = gets.strip.split(' ').map(&:to_i)
  puts get_ways(coins, target)
end

hackerrank

