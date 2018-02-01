#https://www.hackerrank.com/challenges/30-binary-trees/problem

class Node
  attr_accessor :left,:right,:data
  def initialize data
    @left=@right=nil
    @data=data
  end
end
class Solution
  def insert (root,data)
    if root==nil
      return Node.new(data)
    else
      if data<=root.data
        cur=self.insert(root.left,data)
        root.left=cur
      else
        cur=self.insert(root.right,data)
        root.right=cur
      end
    end
    return root
  end
  #----------------------------my code start---------------------------
  def levelOrder(root, arr = [], nodes = nil)
    if nodes.nil?
      nodes = [root]
    end
    
    next_nodes = []
    nodes.each do |x|
      arr << x.data
      if x.left
        next_nodes << x.left
      end
      
      if x.right
        next_nodes << x.right
      end
    end
    
    if next_nodes.count == 0
      puts arr.join(' ')
    else
      levelOrder(root, arr, next_nodes)
    end
  end
end

#-----------------------------------my code end---------------------------
myTree=Solution.new
root=nil
T=gets.to_i
for i in 1..T
  data=gets.to_i
  root=myTree.insert(root,data)
end
myTree.levelOrder(root)
