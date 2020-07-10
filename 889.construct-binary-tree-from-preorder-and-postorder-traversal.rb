#
# @lc app=leetcode id=889 lang=ruby
#
# [889] Construct Binary Tree from Preorder and Postorder Traversal
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
# @param {Integer[]} pre
# @param {Integer[]} post
# @return {TreeNode}
def construct_from_pre_post(pre, post)
  return if pre.empty?

  root = TreeNode.new(pre.first)
  return root if pre.size == 1

  left_branch_size = post.index(pre[1]) + 1
  root.left = construct_from_pre_post(pre[1, left_branch_size], post[0, left_branch_size])
  root.right = construct_from_pre_post(pre[left_branch_size+1..-1], post[left_branch_size..-2])
  root
end
# @lc code=end

