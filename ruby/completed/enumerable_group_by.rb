#https://www.hackerrank.com/challenges/ruby-enumerable-group-by/problem
#completed Oct 2017

def group_by_marks(marks, pass_marks)
      a = marks.group_by {|x,y| y >= pass_marks}
      b = {"Passed" => a[true],
           "Failed" => a[false]}
      b.delete_if {|k,v| v == nil}
      b

end
