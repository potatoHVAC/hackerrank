#https://www.hackerrank.com/challenges/30-binary-search-trees/problem

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
  #----------------------my code start----------------------------
  def getHeight(root, max = 0, current = 0)
    if root.left.nil? && root.right.nil?
      return max
    end
    
    current += 1
    rmax = current
    if root.right != nil
      if current > max
        rmax = getHeight(root.right, current, current)
      else
        rmax = getHeight(root.right, max, current)
      end
    end
    
    lmax = current
    if root.left != nil
      if current > max
        lmax = getHeight(root.left, current, current)
      else
        lmax = getHeight(root.left, max, current)
      end
    end
    
    [lmax, rmax].max
  end
end

#----------------------my code end-----------------------------



myTree=Solution.new
root=nil
T=gets.to_i
for i in 1..T
  data=gets.to_i
  root=myTree.insert(root,data)
end
height=myTree.getHeight(root)
print height
