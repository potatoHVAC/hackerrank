# https://www.hackerrank.com/challenges/components-in-graph/problem
# this one times out for long sequential links. See solution in Take 2
# completed 3/9/18

class Node
  include Enumerable

  attr_accessor :data, :neighbor, :touch
  def initialize(data)
    @data = data
  end

  def add(link)
    @neighbor = [] if @neighbor.nil?
    @neighbor << link
  end

  def each(&block)
    if touch.nil?
      @touch = true
      block.call(self)
      @neighbor.each { |node| node.each(&block) } if @neighbor
    end
  end
end

class Group

  attr_accessor :list
  def initialize(num)
    @list = Array.new(num * 2)
    
    @min = 2 * num
    @max = 0
  end

  def check(num)
    if num > 1
      @min = num if num < @min
      @max = num if num > @max
    end
  end

  def add(g, b)
    @list[g - 1] = Node.new(g) if @list[g - 1].nil?
    @list[b - 1] = Node.new(b) if @list[b - 1].nil?
    
    @list[g - 1].add(@list[b - 1])
    @list[b - 1].add(@list[g - 1])
  end

  def answer
    @list.each do |node|
      if node
        count = 0
        node.each { |_| count += 1 }
        check(count)
        puts "node #{node.data} count #{count}"
      end
    end

    [@min, @max]
  end
end

def hackerrank
  n = gets.strip.to_i
  root = Group.new(n)
  
  n.times do
    g, b = gets.strip.split(' ').map(&:to_i)
    root.add(g, b)
  end

  puts root.answer.join(' ')
end
  
test1 = Group.new(4)
test1.add(1,5)
test1.add(2,5)
test1.add(2,6)
test1.add(3,6)
p test1.answer
