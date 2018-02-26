# https://www.hackerrank.com/contests/rookierank-4/challenges/height-and-total-height-of-a-bst
# completed 2/17/2018

class Node

  attr_accessor :left, :right, :data, :height, :up
  def initialize(data, up = nil)
    @up = up
    @data = data
    @height = 0
  end

  def each_up(&block)
    block.call(self)
    up.each_up(&block) if up
  end
  
  def each(&block)
    @left.each(&block) if @left
    block.call(self)
    @right.each(&block) if @right
  end

  def insert(new_data)
    if new_data < data
      if @left.nil?
        height_fix if right.nil?
        @left = Node.new(new_data, self)
      else
        @left.insert(new_data)
      end
    elsif new_data > data
      if @right.nil?
        height_fix if left.nil?
        @right = Node.new(new_data, self)
      else
        @right.insert(new_data)
      end
    end
  end

  def height_fix
    self.each_up do |node|
      node.height += 1
      if node.up
        if node.up.height > node.height
          break
        end
      end
    end
  end

  def total_height
    @@total_height = 0
    self.each { |node| @@total_height += node.height }
    @@total_height
  end
end

root = Node.new(5)
[1,7, 2,3,5,6,7,8,4,5,2].each { |n| root.insert(n) }

puts root.total_height
puts root.height
puts root.inspect
