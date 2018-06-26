# https://www.hackerrank.com/challenges/qheap1/problem
# 

class Heap

  attr_accessor :data, :last_i, :history
  def initialize
    @data = Array.new(2)
    @last_i = 0
    @history = []
    @index_hash = Hash.new
  end

  def action(arr)
    id, v = arr
    
    case id
    when 1
      add(v)
    when 2
      delete(v)
    when 3
      history << @data[1]
      @data[1]
    end
  end

  def add(v)
    @last_i += 1
    @data[last_i] = v
    @index_hash[v] = last_i
    swap_min(last_i)
    extend_arr
    nil
  end

  def extend_arr
    len = @data.length
    if last_i + 2 == len
      @data + Array.new(len)
    end
  end

  def delete(v)
    i = find_in_heap(v, 1, last_i)
    @data[i], @data[last_i] = @data[last_i], @data[i]
    @data[last_i] = nil
    @last_i -= 1
    nil
  end

  def find_in_heap(v, pos, last)
    return -1 if last <= pos
    return pos if @data[pos] == v

    left = find_in_heap(pos*2, last)

    return left if left > -1

    find_in_heap(v, pos*2 + 1, last)
  end
    

  def swap_min(i)
    if @data[i] < @data[1]
      @data[i], @data[1] = @data[1], @data[i]
    end
  end

  def min
    for i in 2..last_i
      if @data[i] < @data[1]
        @data[1], @data[i] = @data[i], @data[1]
      end
    end
  end
  
  def to_s
    @history.join(' ')
  end
end

def hackerrank
  n = gets.strip.chomp.to_i

  heap = Heap.new
  n.times do |input|
    action_message = heap.action(gets.strip.split(' ').map(&:to_i))
    puts action_message if action_message
  end
end

require 'open-uri'

input0 = 'https://hr-testcases-us-east-1.s3.amazonaws.com/15379/input00.txt?AWSAccessKeyId=AKIAJ4WZFDFQTZRGO3QA&Expires=1522047198&Signature=jG%2FwAmNlQrTw7z7Ev1GXZlXtSVQ%3D&response-content-type=text%2Fplain'
input9 = 'https://hr-testcases-us-east-1.s3.amazonaws.com/15379/input09.txt?AWSAccessKeyId=AKIAJ4WZFDFQTZRGO3QA&Expires=1522052366&Signature=EtebkWROs%2BwB2XITPDuQO8BlZSg%3D&response-content-type=text%2Fplain'

answer0 = 'https://hr-testcases-us-east-1.s3.amazonaws.com/15379/output00.txt?AWSAccessKeyId=AKIAJ4WZFDFQTZRGO3QA&Expires=1522047203&Signature=z0C763j9g1oJ4HLHuIyiKIaNsog%3D&response-content-type=text%2Fplain'
answer9 = 'https://hr-testcases-us-east-1.s3.amazonaws.com/15379/output09.txt?AWSAccessKeyId=AKIAJ4WZFDFQTZRGO3QA&Expires=1522052371&Signature=xiRFQbOHtuPXd0X7vTS4QMydeV0%3D&response-content-type=text%2Fplain'


def parse_webpage(url)
  body = open(url).read.split("\n").map { |str| str.split(' ').map(&:to_i) }
end
  
def run_testcase?(input, answer)
  input_arr = parse_webpage(input)[1..-1]
  answer_arr = parse_webpage(answer).map {|arr| arr[0] }
  
  case_heap = Heap.new

  input_arr.each { |arr| case_heap.action(arr)}

  case_heap.history == answer_arr
end


#puts run_testcase?(input0, answer0)
