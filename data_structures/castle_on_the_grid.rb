#!/bin/ruby
# https://www.hackerrank.com/challenges/castle-on-the-grid/problem
# completed 3/18/2018

class Node

  attr_accessor :pos, :N, :E, :S, :W, :forbidden, :touch
  def initialize(x, y, forbidden)
    @pos = [x, y]
    @forbidden = true if forbidden == 'X'
    @N = @S = @E = @W = []
  end

  def to_s
    if forbidden
      ' X '
    else
      @pos.join(' ')
    end
  end

  def insert(direction, friends)
    case direction
    when :N
      @N = friends
    when :E
      @E = friends
    when :S
      @S = friends
    when :W
      @W = friends
    end
  end

  def neighbors
    arr = (@N + @S + @E + @W).reject{ |node| node.touch }
    arr.each { |node| node.touch = true }
    arr
  end
end

class Grid

  attr_accessor :grid
  def initialize(grid_arr)
    @grid = populate_nodes(grid_arr)

    horiz_friends
    vert_friends
  end
  
  def populate_nodes(grid)
    grid.map.with_index do |row, x|
      row.map.with_index { |char, y| Node.new(x, y, char) }
    end
  end

  def horiz_friends
    @grid.each do |row|
      friends = []
      row.each do |node|
        if node.forbidden
          friends = set(friends, :row)
        else
          friends << node
        end
      end

      set(friends, :row) if friends.any? 
    end
  end

  def vert_friends
    for i in 0...@grid.length
      col = []
      @grid.each { |row| col << row[i] }
      friends = []
      col.each do |node|
        if node.forbidden
          friends = set(friends, :col)
        else
          friends << node
        end
      end

      set(friends, :col) if friends.any?
    end
  end
  
  def set(friends, dir)
    nw = []
    se = friends
    while se.any?
      target = se.shift
      if dir == :row
        target.insert(:W, nw.dup)
        target.insert(:E, se.dup)
      else
        target.insert(:N, nw.dup)
        target.insert(:S, se.dup)
      end
      
      nw << target
    end
    
    []
  end          
          
  def to_s
    @grid.map do |row|
      row.map { |node| "[#{node.to_s}]" }.join(', ')
    end.join("\n")
  end
  
  def path(x0, y0, x1, y1)
    start = @grid[x0][y0]
    finish = @grid[x1][y1]
    get_to([start], finish, 0)
  end

  def get_to(start_arr, finish, count)
    next_nodes = []
    start_arr.each do |node|
      return count if node == finish
      next_nodes << node.neighbors
    end

    get_to(next_nodes.flatten, finish, count + 1)
  end
end                       

def minimumMoves(grid, startx, starty, goalx, goaly)
    # Complete this function
end


def hackerrank
  n = gets.strip.to_i
  grid = []
  n.times do
    row = gets.strip.split('')
    grid << row
  end
  
  x0, y0, x1, y1 = gets.strip.split(' ').map(&:to_i)
  puts Grid.new(grid).path(x0, y0, x1, y1)
end

def test
  grid = [[".", "X", "."],
          [".", "X", "."],
          [".", ".", "."]]

  a = Grid.new(grid)
  puts a.path(0,0,0,2)
end

test
