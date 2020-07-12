#
# @lc app=leetcode id=105 lang=ruby
#
# [105] Construct Binary Tree from Preorder and Inorder Traversal
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
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.nil? || preorder.empty?

  root = TreeNode.new(preorder[0])
  return root if preorder.size == 1

  left_branch_size = inorder.index(preorder[0])

  root.left = build_tree(preorder[1, left_branch_size], inorder[0, left_branch_size])
  root.right = build_tree(preorder[left_branch_size+1..-1], inorder[left_branch_size+1..-1])
  root
end
# @lc code=end

