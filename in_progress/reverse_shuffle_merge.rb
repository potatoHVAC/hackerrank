#!/bin/ruby
#https://www.hackerrank.com/challenges/reverse-shuffle-merge/problem
#started 12/23/17

def reverseShuffleMerge(s)
    letter_hash = populate_hash(s)
    half_letter_hash = {}
    letter_hash.each {|k,v| half_letter_hash[k] = v / 2}

    answer = create_string(half_letter_hash)

end

def populate_hash(s)
    hash = Hash.new(0)
    s.split('').each {|x| hash[x] += 1}
    hash
end

def create_string(hash)
  answer = ''
  for char in 'a'..'z'
    if hash[char]
      answer += char * hash[char]
    end
  end
  answer
end



s = gets.strip
result = reverseShuffleMerge(s)
puts result
