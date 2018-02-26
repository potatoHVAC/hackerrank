#!/bin/ruby

def DNAValue(s)
  len = s.length
  max_k = Array.new(len, 0)
  
  for i in 0...len
    k = 0
    range = [i, len - i - 1].min

    for j in 0..range
      if s[0, j + 1] == s[i, j + 1]
        if s[0, j + 1] == s[i - j, j + 1]
          k = j + 1
        end
      else
        break
      end
    end

    max_k[i] = k
  end
        
  max_k
end













def hackerrank
  s = gets.strip
  result = DNAValue(s)
  print result.join(" ")
end

def test1(str)
  puts "test 1"
  puts str.split('').join(' ')
  puts DNAValue(str).join(' ')
end

test1("babbabababb")
test1('bab')
