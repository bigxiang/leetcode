#
# @lc app=leetcode id=589 lang=ruby
#
# [589] N-ary Tree Preorder Traversal
#

# @lc code=start
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  result = []
  visited = {}
  node = root
  parent = nil
  while node
    result << node.val
    visited[node] = parent

    node.children.each do |child|
      next if visited[child]

      parent = node
      node = child
    end

    if 
    node = parent
    parent = visited[parent]


    if node
      parent = visited[node]
      puts node.val, parent.val
    else

    end
  end
  result
end
# @lc code=end

