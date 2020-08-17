#
# @lc app=leetcode id=110 lang=ruby
#
# [110] Balanced Binary Tree
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
# @return {Boolean}
def is_balanced(root)
  solve(root)[0]
end

def solve(root)
  return [true, 0] if root.nil?

  left_balanced, left_height = solve(root.left)
  right_balanced, right_height = solve(root.right)
  height = [left_height, right_height].max + 1
  [left_balanced && right_balanced && (left_height - right_height).abs <= 1, height]
end
# @lc code=end
