#!/bin/ruby
# https://www.hackerrank.com/contests/rookierank-4/challenges/winning-hand-of-cards/problem
# completed 2/20/18

def winningHands(mod, target, cards)
  if target == 0
    num = cards
  else
    num = cards.map { |n| n % mod }.reject { |n| n == 0 } 
  end
  
  total = []
  num.length.times { total << Hash.new(0) }

  num.each_with_index do |card, i|
    total[i][card] += 1
    if i > 0 
      total[i - 1].each do |sum, count|
        if target != 0
          next_sum = (sum * card) % mod
        else
          next_sum = sum * card
        end
        total[i][sum] += count
        total[i][next_sum] += count
      end
    end
  end

  ans = 0
  total.last.each do |sum, count|
    if sum%mod == target
      ans += count
    end
  end

  ans  
end

def hackerrank
  number, mod, target = gets.strip.split(' ').map(&:to_i)
  cards = gets.strip.split(' ').map(&:to_i)
  puts winningHands(mod, target, cards[0...number])
end

def t(m,x,a)
  puts a.length
  puts winningHands(m,x,a)
end

b = %w{1 1 1 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}.map(&:to_i)
a = %w{1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3}.map(&:to_i)

t(3,2,[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])
t(1,0,a)


c = %w{8999603 6669148 2575728 7054614 3071655 136709 7392245 4066335 841632 6406395 2386755 1308189 9667712 4486178 3813287 5933418 3239381 6801310 2226522 5353585 7109904 3507416 7727110 7535221 9546554 8858414 7097814 188503 124190 859377}.map(&:to_i)

t(826784, 112, c)
