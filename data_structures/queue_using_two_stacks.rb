# https://www.hackerrank.com/challenges/queue-using-two-stacks/problem
# Completed 2/12/18

class Queue
  def initialize
    @queue = []
  end

  def insert(num)
    @queue.push(num)
  end

  def get
    @queue.shift
  end

  def show_first
    puts @queue[0]
  end
end

def hackerrank
  q = gets.strip.to_i
  queue = Queue.new
  
  q.times do
    type, num = gets.strip.split(' ').map(&:to_i)
    case type
    when 1; queue.insert(num)
    when 2; queue.get
    when 3; queue.show_first
    end
  end
end

hackerrank     
