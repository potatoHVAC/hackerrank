#!/bin/ruby
#https://www.hackerrank.com/challenges/insertion-sort/problem
#works but times out on most test cases. abandoning for something else.

class Node
  include Enumerable
  attr_accessor :data, :up, :left, :right, :count, :count_r, :balance

  @@shifts = 0
  
  def initialize(data)
    @data = data
    @count_r = 0
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
        @right = Node.new(num)
      else
        @right.insert(num)
      end
      
    else
      @@shifts += @count + @count_r
      if @left.nil?
        @balance -= 1
        balance_up if @balance != 0
        @left = Node.new(num)
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

hackerank


######################################################################

def test1
  root = Node.new(7)
  root.left = Node.new(3)
  root.right = Node.new(12)
  puts root
end

#---------------------old failed but interesting attempt ------------------------------

# class Node
#   attr_reader :data
#   attr_accessor :nxt, :count

#   def initialize(data, nxt = nil)
#     @data = data
#     @nxt = nxt
#     @count = 1
#   end
# end

# class List
#   include Enumerable
#   attr_accessor :head, :shifts

#   def initialize(data)
#     @head = Node.new(data)
#     @shifts = 0
#   end

#   def to_s
#     self.map { |node| [node.data] * node.count }.reverse.join(' ')
#   end
  
#   def each
#     if block_given?
#       current = head
#       while current
#         yield current
#         current = current.nxt
#       end
#     end
#   end

#   def insert(value)
#     if head.data < value
#       @head = Node.new(value, head)
#     else
#       self.each do |node|
#         if node.data == value
#           node.count += 1
#           break
#         elsif node.nxt.nil?
#           node.nxt = Node.new(value)
#           @shifts += node.count
#           break
#         elsif node.nxt.data < value
#           node.nxt = Node.new(value, node.nxt)
#           break
#         end

#         @shifts += node.count
#       end
#     end
#   end
# end

# def hackerank
#   t = gets.strip.to_i
#   for a0 in (0..t-1)
#     n = gets.strip.to_i
#     arr = gets.strip.split(' ').map(&:to_i)
#     list = List.new(arr.shift)
#     arr.each { |num| list.insert(num) }
#     puts list.shifts
#   end
# end

# hackerank
