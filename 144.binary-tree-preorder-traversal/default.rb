#
# @lc app=leetcode id=144 lang=ruby
#
# [144] Binary Tree Preorder Traversal
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  result = []

  traversal(root, result)

  result
end

def traversal(node, result)
  return if node.nil?

  result << node.val
  traversal(node.left, result)
  traversal(node.right, result)
end
# @lc code=end

