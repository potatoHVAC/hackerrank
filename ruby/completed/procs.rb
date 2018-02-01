#https://www.hackerrank.com/challenges/ruby-procs/problem
#completed Oct 2017

def square_of_sum (my_array, proc_square, proc_sum)
    sum = proc_sum.call(my_array)
    proc_square.call(sum)
end

proc_square_number = proc {|x| x*x}
proc_sum_array     = proc {|x| x.reduce(0,:+)}
my_array = gets.split().map(&:to_i)

puts square_of_sum(my_array, proc_square_number, proc_sum_array)
