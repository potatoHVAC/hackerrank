#!/bin/ruby
# https://www.hackerrank.com/challenges/largest-rectangle/problem
# completed 3/6/18

class Node
  include Enumerable

  @@max = 0

  attr_accessor :data, :nxt, :count
  def initialize(data, count = 0)
    @data = data
    @count = count + 1
  end

  def each(&block)
    block.call(self)
    nxt.each(&block) if nxt
  end

  def insert(new)
    if self.data <= new
      @count += 1
    end
        
    if nxt
      if nxt.data < new
        nxt.insert(new)
      elsif nxt.data > new
        self.nxt.max
        @nxt = Node.new(new, @nxt.count)
      end
    elsif data < new
      @nxt = Node.new(new)
    end
  end
      
  def max
    self.each do |node|
      total = node.count * node.data
      @@max = total if @@max < total
    end

    @@max
  end
end

def largestRectangle(h)
  root = Node.new(0)
  h.each { |num| root.insert(num) }
  root.max
end

def hackerrank
  n = gets.strip.to_i
  h = gets.strip.split(' ').map(&:to_i)
  puts largestRectangle(h)
end

