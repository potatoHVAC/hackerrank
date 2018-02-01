#https://www.hackerrank.com/challenges/30-testing/problem

def test1()
  puts '5'
  #YES
  puts '3 3'
  puts '-1 0 1'
  #NO
  puts '3 2'
  puts '-1 0 1'
  #YES
  puts '200 3'
  puts [*-1..198].join(' ')
  #NO
  puts '200 2'
  puts [*-1..198].join(' ')
  #YES
  puts '4 4'
  puts '-999 0 0 999'
end


test1
