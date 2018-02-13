#!/bin/ruby
# https://www.hackerrank.com/challenges/game-of-two-stacks/problem
# completed 2/12/2018

class Game
  def initialize(a, b, max)
    @a = a
    @a_pointer = -1
    @a_len = a.length

    @b = b
    @b_pointer = -1
    @b_len = b.length
    
    @max = max

    @sum = 0
    @max_count = 0
  end

  def count
    count = @a_pointer + @b_pointer + 2
    if count > @max_count
      @max_count = count
    end
    
    count
  end
  
  def to_s
    @max_count.to_s
  end
  
  def add_a
    if @a_pointer + 1 >= @a_len
      return false
    end
    next_num = @a[@a_pointer + 1]

    if @sum + next_num > @max
      return false
    else
      @sum += next_num
      @a_pointer += 1
      count
    end
  end

  def add_b
    if @b_pointer + 1 >= @b_len
      return false
    end
    next_num = @b[@b_pointer + 1]

    if @sum + next_num > @max
      return false
    else
      @sum += next_num
      @b_pointer += 1
      count
    end
  end
    
  def start
    while add_a ; end
    while add_b ; end
  end

  def remove_a
    if @a_pointer < 0
      return false
    else
      @sum -= @a[@a_pointer]
      @a_pointer -= 1
    end
  end

  def round
    self.start
    while self.remove_a
      while self.add_b
      end
    end
  end
end
  
def hackerrank
  g = gets.strip.to_i
  for a0 in (0..g-1)
    n,m,x = gets.strip.split(' ').map(&:to_i)
    a = gets.strip.split(' ').map(&:to_i)
    b = gets.strip.split(' ').map(&:to_i)

    game = Game.new(a, b, x)
    game.round
    puts game
  end
end

#hackerrank

#######################################################3

def test1
  first = Game.new([1,3,7,3,4,3,2],[555],10)
  first.start
  puts first
end

def test2(a, b, max)
  game = Game.new(a, b, max)
  game.round
  puts game
end

test2([1,3,5,7,9],[2,4,6,8,10], 10)
test2([4,2,4,6,1], [2,1,8,5], 10)
test2("7 15 12 0 5 18 17 2 10 15 4 2 9 15 13 12 16".split(' ').map(&:to_i),
      "12 16 6 8 16 15 18 3 11 0 17 7 6 11 14 13 15 6 18 6 16 12 16 11 16 11".split(' ').map(&:to_i), 62)

test2([100],[100], 1)
test2([1,1,1,1,1,1,1,1], [1,1,1,1,1,1,1,1], 3)
test2([1,1], [1,1], 20)
