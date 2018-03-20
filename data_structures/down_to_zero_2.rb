#!/bin/ruby
# https://www.hackerrank.com/challenges/down-to-zero-ii/problem
# completed 3/20/18

module Thing

  def prime_factors_of(num, spf = 2, prime = Hash.new(0))
    if num == 1 or spf > Math.sqrt(num)
      prime[num] += 1 if num != 1
      return prime
    elsif num % spf == 0
      prime[spf] += 1
      prime_factors_of(num / spf, spf, prime)
    else
       prime_factors_of(num, spf + 1, prime)
    end
  end

  def combinations(hash)
    return [1] if hash.empty?
    num, times = hash.shift
    arr = combinations(hash)
    output = []
    for i in 0..times
      output.concat( arr.map { |n| n * num**i } )
    end
      
    output
  end
  
  def bit_divisors(num)
    factors = prime_factors_of(num)
    combo = combinations(factors)
  end

  def next_nodes(arr)
    return [0] if arr == [1]
    num = arr[-1]
    arr[-1] -= 1
    arr[1..-1].reject { |n| n < Math.sqrt(num) }
  end
end

class Node
  include Thing
  
  attr_reader :height
  attr_accessor :link, :num
  def initialize(num, height = 0)
    @num = num
    @link = []
    @height = height
  end

  def add_link(num)
    nxt = Node.new(num, height + 1)
    @link << nxt
    nxt
  end
end

class Tree
  include Thing
  
  attr_accessor :node_hash, :root
  def initialize(num)
    @root = Node.new(num)
    @node_hash = {num => @root}
  end

  def answer
    if @root.num == 2
      2
    elsif @root.num == 1
      1
    elsif @root.num == 0
      0
    else
      find_path_length
    end
  end
  
  def find_path_length(arr = [@root])
    nxt_links = Array.new
    arr.each do |node|
      nxt_arr = next_nodes(bit_divisors(node.num))
      nxt_arr.each do |num|
        return node.height + 3 if num == 2
        if @node_hash[num].nil?
          nxt = node.add_link(num)
          @node_hash[num] = nxt
        end
      end
      
      nxt_links.concat(node.link)
    end

    find_path_length(nxt_links)
  end
end

  
def hackerrank
  n = gets.strip.to_i
  n.times { puts Tree.new(gets.strip.to_i).answer }
end

def test(num)
  a =  Tree.new(num)
  puts a.prime_factors_of(a.root.num)
  arr = a.bit_divisors(a.root.num).sort
  puts arr.join(', ')
  puts a.next_nodes(arr).join(', ')
  puts a.answer
end

def test2(max)
  for i in 1..max
    puts "#{i}: #{Tree.new(i).answer}"
  end
end

test2(200)
