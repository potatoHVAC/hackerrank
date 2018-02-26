#!/bin/ruby

def check_forward(s, i)

end

def DNAValue(s)
  len = s.length
  answer = Array.new(len, 0)
  
  for i in 0...len
    min = [i, len - i].min

    if s[i] == s[0]
      answer[i] += 1
      for j in 1..min
        if s[i - j] == s[i + j] && s[i + j] == s[j]
          answer[i] += 1
        else
          break
        end
      end
    end
  end

  answer
end

def hackerrank
  s = gets.strip
  result = DNAValue(s)
  print result.join(" ")
end

def test1
  puts "test1"
  a = "babbxabaxba"
  puts a.split('').join(' ')
  puts DNAValue(a).join(' ')
end

test1

