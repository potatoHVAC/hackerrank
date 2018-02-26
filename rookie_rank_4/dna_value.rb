#!/bin/ruby

def check_forward(s, i, len)
  range = [i, len - i - 1].min
  count = 1

  for j in 1...range
    if s[j] == s[i + j]
      count += 1
    else
      return count
    end
  end

  count
end

def check_backward(s, i, max)
  while max > 1
    start_i = i - max + 1
    
    for j in start_i..i
      if s[j] != s[j - start_i]
        break
      elsif j == i
        return max
      end
    end

    max -= 1
  end

  1
end

def DNAValue(s)
  len = s.length
  max_k = Array.new(len, 0)
  max_k[0] = 1
  
  for i in 1...len
    if s[i] == s[0]
      matching_length = check_forward(s, i, len)
      max_k[i] = check_backward(s, i, matching_length)
    end
  end

  max_k
end

def hackerrank
  s = gets.strip
  result = DNAValue(s)
  print result.join(" ")
end

def test1
  puts "test1"
  a = "babbxbbabaaaaaaababbxbbaba"
  puts a.split('').join(' ')
  puts DNAValue(a).join(' ')
end

test1

