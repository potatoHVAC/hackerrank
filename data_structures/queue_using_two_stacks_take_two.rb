# https://www.hackerrank.com/challenges/queue-using-two-stacks/forum
# I decided to redo this with a linked list of sorts
# completed 2/12/2018

class Node
  include Enumerable

  attr_reader :data
  attr_accessor :nxt
  def initialize(data)
    @data = data
  end

  def each(&block)
    block.call(self.data)
    @nxt.each(&block) if @nxt
  end
end

class Queue

  attr_accessor :root, :tail
  def initialize
  end

  def insert(num)
    if @root.nil?
      @root = Node.new(num)
      @tail = @root
    else
    @tail.nxt = Node.new(num)
    @tail = @tail.nxt
    end
  end

  def get
    @first = @root
    @root = @root.nxt
    @first.data
  end

  def show_first
    puts @root.data
  end

  def to_s
    str = @root.map { |data| data }.join(', ')
    "[#{str}]"
  end
end

def hackerrank
  q = gets.strip.to_i
  queue = Queue.new

  q.times do
    task, num = gets.strip.split(' ').map(&:to_i)
    case task
    when 1; queue.insert(num)
    when 2; queue.get
    when 3; queue.show_first
    end
  end
end

#hackerrank

a = Queue.new
a.insert(5)
a.insert(6)
a.show_first
a.get
a.show_first
