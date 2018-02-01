#!/bin/ruby
#https://www.hackerrank.com/challenges/plus-minus/problem
#solved 11/21/17

class Int
    attr_accessor :number, :pos

    @@pos = 0
    @@neg = 0
    @@zero = 0
    @@total = 0

    def initialize(num)
        @number = num
        self.sign
        @@total += 1
    end

    def sign
        if self.number < 0
            @@neg += 1
        elsif self.number > 0
            @@pos += 1
        else
            @@zero += 1
        end
    end

    def pos
      response = @@pos.to_f / @@total
      response.round(6)
    end

    def neg
      response = @@neg.to_f / @@total
      response.round(6)
    end

    def zero
      response = @@zero.to_f / @@total
      response.round(6)
    end
end
n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
arr.map! {|x| x = Int.new(x)}

puts arr[0].pos
puts arr[0].neg
puts arr[0].zero
