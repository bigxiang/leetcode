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
  return [] if root.nil?

  result = []
  access_node(root, result)
  result
end

def access_node(node, result)
  result << node.val

  node.children.each { |child| access_node(child, result) }
end
# @lc code=end

