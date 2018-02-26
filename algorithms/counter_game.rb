#!/bin/ruby
# https://www.hackerrank.com/challenges/counter-game/problem
# completed 2/15/18

def winner_for(turn)
  if turn%2 == 0
    return "Richard"
  else
    return "Louise"
  end
end

def counterGame(n)
    number_of_turns = (n - 1).to_s(2).count('1')
    winner_for(number_of_turns)
end

def hackerrank
  t = gets.strip.to_i
  for a0 in (0..t-1)
      n = gets.strip.to_i
      result = counterGame(n)
      puts result
  end
end

hackerrank
