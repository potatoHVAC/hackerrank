#!/bin/ruby
#https://www.hackerrank.com/challenges/birthday-cake-candles/problem
#solved 12/12/31

class Candle

  attr_accessor :height

  def initialize(height)
    @height = height
    tallest_check(height)
  end

  def tallest_check(height)
    if defined?(@@tallest)
      if height > @@tallest
        @@tallest = height
      end
    else
      @@tallest = height
    end
  end

  def tallest
    @@tallest
  end
end

def birthdayCakeCandles(n, ar)
  tallest_count = 0
  ar.each do |x|
    if x.height == x.tallest
      tallest_count += 1
    end
  end
  tallest_count
end

n = gets.strip.to_i
ar = gets.strip
ar = ar.split(' ').map(&:to_i)
candle_list = []
ar.each{|x| candle_list << Candle.new(x)}
result = birthdayCakeCandles(n, candle_list)
puts result;
