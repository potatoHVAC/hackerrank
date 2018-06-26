#!/bin/ruby
# https://www.hackerrank.com/challenges/flipping-the-matrix/problem
# 

class Matrix

  def initialize(n)
    @n = n
    @size = 2*n
    @grid = Array.new(size)

    for i in 0...size
      @grid[i] = gets.strip.split(' ').map(&:to_i)
    end
  end

  def add
    total = 0
    for i in 0...@n
      total += @grid[i][0...@n].inject(:+)
    end
    
    total
  end

  def max
  end
end


def hackerrank
  set = Array.new(gets.strip.to_i)
  set.map { Matrix.new(gets.strip.to_i) }
end
