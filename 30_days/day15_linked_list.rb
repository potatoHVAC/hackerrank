class Node

  attr_accessor :data,:next

  def initialize data
    @data = data
    @next = nil
  end
end

class Solution 
  #----------------------------my code start--------------------------
  def insert(head,value)
    #Complete this method
    next_value = Node.new(value)
    if head == nil
      next_value
    else
      current = head
      while current.next != nil
        current = current.next
      end
      current.next = next_value
      head
    end
  end

  #----------------------------my code end----------------------------
  def display(head)
    current = head
    while current 
      print current.data," "
      current = current.next
    end
  end
end

mylist= Solution.new
head=nil
T=gets.to_i
for i in 1..T
  data=gets.to_i
  head=mylist.insert(head,data)
end
mylist.display(head)
