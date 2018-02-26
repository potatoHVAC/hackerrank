#!/bin/ruby
# https://www.hackerrank.com/contests/rookierank-4/challenges/server-room-safety
# Completed 2/17/18

class Server

  attr_reader :height, :position
  attr_accessor :left, :right, :fall_left, :fall_right
  def initialize(height, position, left = nil)
    @height = height
    @position = position
    @left = left
  end

  def each(&block)
    block.call([self.height, self.position])
    right.each(&block) if right
  end
  
  def push_left
    @fall_left = true
    
    nxt = left
    while nxt
      if position - height <= nxt.position
        nxt.fall_left = true
        nxt = nxt.left
      else
        break
      end
    end
    
    left.push_left if left && left.fall_left
  end
  
  def push_right
    @fall_right = true
    nxt = right
    while nxt
      if position + height >= nxt.position
        nxt.fall_right = true
        nxt = nxt.right
      else
        break
      end
    end
    
    right.push_right if right && right.fall_right
  end
end

class Room
  include Enumerable

  attr_accessor :left_server, :right_server
  def initialize
    @left_server = nil
    @right_server = nil
  end

  def each(&block)
    left_server.each(&block)
  end
   
  def to_s
    arr = self.map{ |h, p| [h,p] }
    str = arr[0][0].to_s
    for i in 1...arr.length
      str += "-" * (arr[i][1] - arr[i - 1][1])
      str += arr[i][0].to_s
    end
    str
  end
  
  def insert(height, position)
    if @left_server.nil?
      @right_server = @left_server = Server.new(height, position)
    else
      last = @right_server
      last.right = Server.new(height, position, last)
      @right_server = last.right
    end
  end

  def safety_check
    @left_server.push_right
    @right_server.push_left
    
    left_dead = @right_server.fall_right
    right_dead = @left_server.fall_left
    
    if left_dead && right_dead
      "BOTH"
    elsif left_dead
       "LEFT"
    elsif right_dead
       "RIGHT"
    else
       "NONE"
    end
  end
end

def hackerrank
  n = gets.strip.to_i
  return "BOTH" if n == 1
  position = gets.strip.split(' ').map(&:to_i)
  height = gets.strip.split(' ').map(&:to_i)
  server_room = Room.new
  for i in 0...n
    server_room.insert(height[i], position[i])
  end
  puts server_room.safety_check
end

def test1
  puts "test1"
  a = Room.new
  a.insert(1,1)
  a.insert(4,3)
  puts a
  puts a.inspect
end

def test2
  puts "test2"
  a = Room.new
  a.insert(10,1)
  a.insert(1,2)
  a.insert(1,5)
  a.safety_check
end

def test3
  puts "test3"
  a = Room.new
  a.insert(50,1)
  a.insert(1,2)
  a.insert(1,5)
  a.insert(50,6)
  puts a
  puts a.safety_check
end

test3
