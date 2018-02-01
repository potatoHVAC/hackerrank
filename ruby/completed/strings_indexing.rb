#https://www.hackerrank.com/challenges/ruby-strings-indexing/problem
#completed Oct 2017

# Your code here
def serial_average(str)
   b = str.split('-')
   "#{b[0]}-#{((b[1].to_f+b[2].to_f)/2).round(2)}" 
end
