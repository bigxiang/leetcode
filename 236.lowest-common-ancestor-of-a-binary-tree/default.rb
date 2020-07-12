#
# @lc app=leetcode id=236 lang=ruby
#
# [236] Lowest Common Ancestor of a Binary Tree
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  result = TreeNode.new
  travel(root, p, q, result)
  result
end

def travel(node, p, q, result)
  return if node.nil?

  left_found = travel(node.left, p, q, result)
  right_found = travel(node.right, p, q, result)
  node_found = (node == p || node == q)

  result.val = node.val if [left_found, right_found, node_found].count { |f| f } >= 2

  left_found || right_found || node_found
end
# @lc code=end

