#!/bin/ruby
# https://www.hackerrank.com/challenges/kingdom-division/problem
#

class Node
  include Enumerable

  @@max = 0
  
  attr_accessor :combinations, :children, :index
  def initialize(i)
    @index = i
    @combinations = 0
    @children = []
  end

  def insert_child(c_node)
    @children << c_node
  end

  def each(&block)
    block.call(self)
    self.children.each { |child| child.each(&block)}
  end

  def to_s
    self.map { |node| node.index }.join(' ')
  end    
end
    

def kingdom_division(n, roads)
  max = 0
  city = Array.new(n)
  for i in 0...n
    city[i] = Node.new(i)
  end

  roads.reverse_each do |arr|
    city[arr[0] - 1].insert_child(city[arr[1] - 1])
  end

p city
  
  city
end

def hackerrank
  n = gets.strip.to_i
  roads = Array.new(n-1)
  for i in (0...n-1)
    roads[i] = gets.strip.split(' ').map(&:to_i)
  end
  
  result = kingdom_division(n, roads)
  puts result
end

puts kingdom_division(3, [[1,2], [1,3]])[0]
