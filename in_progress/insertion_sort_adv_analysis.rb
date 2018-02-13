#!/bin/ruby
#https://www.hackerrank.com/challenges/insertion-sort/problem
#works but times out on most test cases. abandoning for something else.

class Node
  include Enumerable
  attr_accessor :data, :up, :left, :right, :count, :count_l, :count_r, :balance

  @@shifts = 0
  
  def initialize(data, up = nil)
    @data = data
    @up = up
    @count_r = 0
    @count_l = 0
    @count = 1
    @balance = 0
  end

  def to_s
    str = self.map { |node| [node.data] * node.count }.join(', ')
    "[#{str}]"
  end
  
  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  def each_up(&block)
    block.call(self)
    up.each_up(&block) if up
  end

  def <=>(other_node)
    data <=> other_node.data
  end

  def insert(num)
    if num == @data
      @@shifts += @count_r
      @count += 1
      
    elsif num > @data
      @count_r += 1
      if @right.nil?
        @balance += 1
        balance_up if @balance != 0
        @right = Node.new(num, self)
      else
        @right.insert(num)
      end
      
    else
      @@shifts += @count + @count_r
      if @left.nil?
        @balance -= 1
        balance_up if @balance != 0
        @left = Node.new(num, self)
      else
        @left.insert(num)
      end
      
    end
  end

  def shifts
    @@shifts
  end

  def self.reset_shifts
    @@shifts = 0
  end
end

def hackerank
  t = gets.strip.to_i
  for a0 in (0..t-1)
    n = gets.strip.to_i
    arr = gets.strip.split(' ').map(&:to_i)

    
    puts head.shifts
  end
end

#hackerank


######################################################################

def test1
  root = Node.new(7)
  root.left = Node.new(3)
  root.right = Node.new(12)
  puts root
end
