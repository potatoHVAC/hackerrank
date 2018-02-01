#https://www.hackerrank.com/challenges/30-linked-list-deletion/problem
class Node

  attr_accessor :data,:next

  def initialize data
    @data = data
    @next = nil
  end
end

class Solution
  #---------------------------my code start---------------------------------
  def removeDuplicates(head)
    current = head
    while current
      while current.next && current.data == current.next.data
        current.next = current.next.next
      end
      current = current.next
    end
    head
  end
  #--------------------------end my code-----------------------------
  def insert(head,value)
    p=Node.new(value)
    if head==nil
      head=p
    elsif head.next==nil
      head.next=p
    else  
      current = head
      while current.next != nil
        current = current.next
      end 
      current.next = p
    end
    return head   
  end 	

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
head=mylist.removeDuplicates(head)
mylist.display(head)
