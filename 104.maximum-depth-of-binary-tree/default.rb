#
# @lc app=leetcode id=104 lang=ruby
#
# [104] Maximum Depth of Binary Tree
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
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  [max_depth(root.left), max_depth(root.right)].max + 1
end
# @lc code=end
