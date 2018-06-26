# https://www.hackerrank.com/challenges/truck-tour/problem
# completed 3/20/18

class Loop

  attr_accessor :min, :range, :station
  def initialize
    @station = []
    @range = 0
    @min = 0
    
    @total_fuel = 0
    @total_dist = 0
  end

  def insert(arr)
    @station << arr
    @range += arr[0] - arr[1]
    @min = @range if @range < @min

    @total_fuel += arr[0]
    @total_dist += arr[1]
  end

  def answer
    return nil if @total_dist > @total_fuel
    count = 0
    while @min < 0 && @station.any?
      count += 1
      first = @station.shift
      delta = first[0] - first[1]
      @min -= delta
    end

    count
  end
end
    
def hackerrank
  n = gets.strip.to_i
  loop = Loop.new

  n.times { loop.insert(gets.strip.split(' ').map(&:to_i))}
  puts loop
end

def test
  a = Loop.new
  a.insert([0,2])
  a.insert([0,2])
  a.insert([4,2])
  p a.answer
  p a.min
end

test
