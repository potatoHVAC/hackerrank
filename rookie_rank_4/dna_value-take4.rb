#!/bin/ruby

class Index

  attr_accessor :str, :pos
  def initialize
    @data = {}
  end

  def insert(c, i)
    @data[c] = [] if @data[c].nil?
    @data[c] << i
end

def DNAValue(s)
  len = s.length

  first = Index.new
  
  for i in 0..len/2 + 1
    
    
end

s = gets.strip
result = DNAValue(s)
print result.join(" ")


