#
# @lc app=leetcode id=94 lang=ruby
#
# [94] Binary Tree Inorder Traversal
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
def inorder_traversal(root)
  result = []

  traversal(root, result)

  result
end

def traversal(node, result)
  return if node.nil?

  traversal(node.left, result)
  result << node.val
  traversal(node.right, result)
end
# @lc code=end

